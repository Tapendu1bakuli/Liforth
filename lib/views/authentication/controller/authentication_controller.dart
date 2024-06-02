// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:lightforth/views/authentication/models/create_new_password_response_model.dart';
import 'package:lightforth/views/authentication/models/create_new_password_send_model.dart';
import 'package:lightforth/views/authentication/models/verify_otp_response_model.dart';
import 'package:lightforth/views/authentication/models/verify_otp_send_model.dart';
import 'package:sizing/sizing.dart';

import '../../../default_model/header_model.dart';
import '../../../service/core_service.dart';
import '../../../service/urls.dart';
import '../../../stores/hive_store.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/text_utils/text_utils.dart';
import '../models/forgot_password_response_model.dart';
import '../models/forgot_password_send_model.dart';
import '../models/login_response_model.dart';
import '../models/signup_response_model.dart';
import '../models/signup_send_model.dart';

class AuthenticationController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLoadingTimer = false.obs;
  var signUpPasswordIndicator = true.obs;
  final signUpFormKey = GlobalKey<FormState>();
  var isPasswordError = false.obs;
  var isEmailError = false.obs;
  var isUserNameError = false.obs;
  var isAgreeTermsAndPrivacy = false.obs;
  var isEmailErrorForForgotPassword = false.obs;
  var isPasswordErrorForForgotPassword = false.obs;
  var isPasswordErrorForConfirmForgotPassword = false.obs;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController forgotPasswordController = TextEditingController();
  TextEditingController verifyOTPController = TextEditingController();
  TextEditingController createNewPasswordController = TextEditingController();
  TextEditingController createNewConfirmPasswordController =
      TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final verifyOTPFormKey = GlobalKey<FormState>();
  final createNewPasswordFormKey = GlobalKey<FormState>();
  RxString temporaryTokenForForgotPassword = "".obs;
  final signInFormKey = GlobalKey<FormState>();
  var forgotPasswordIndicator = true.obs;
  var forgotConfirmPasswordIndicator = true.obs;

  //For timer
  Rx<int> secondsRemaining = 0.obs;
  Rx<bool> enableResend = false.obs;
  Timer? timer;

  addTimer() {
    print("enableResend:$enableResend");
    secondsRemaining.value = 20;
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining.value--;
        print(secondsRemaining);
      } else {
        enableResend.value = false;
      }
    });
  }

  void resendCode() {
    addTimer();
    secondsRemaining.value = 20;
    enableResend.value = false;
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

  String? validatePassword(String? password) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;€#])[A-Za-z\d@$!%*?&.*':;€#]{6,}$)";
    RegExp regExp = RegExp(pattern);
    if (password == null || password.isEmpty) {
      isPasswordError.value = true;
      return "Password is required";
    } else if (password.length < 8 || password.length > 15) {
      isPasswordError.value = true;
      return AppStrings.passwordValid.tr;
    } else if (!regExp.hasMatch(password)) {
      isPasswordError.value = true;
      return "Password must contain at least one uppercase letter, one lowercase letter, one special character and one number";
    }
    isPasswordError.value = false;
    return null;
  }

  String? validatePasswordForSignIn(String? password) {
    if (password == null || password.isEmpty) {
      isPasswordError.value = true;
      return "Password is required";
    }
    isPasswordError.value = false;
    return null;
  }

  String? validateEmail(
    String? email,
  ) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      isEmailError.value = true;
      return "Email is required";
    } else if (!regex.hasMatch(email)) {
      isEmailError.value = true;
      return AppStrings.pleaseEnterValidEmailAddress.tr;
    } else {
      isEmailError.value = false;
    }
    isEmailError.value = false;
    return null;
  }

  String? validateEmailForForgotPassword(
    String? email,
  ) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      isEmailErrorForForgotPassword.value = true;
      return "Email is required";
    } else if (!regex.hasMatch(email)) {
      isEmailErrorForForgotPassword.value = true;
      return AppStrings.pleaseEnterValidEmailAddress.tr;
    } else {
      isEmailErrorForForgotPassword.value = false;
    }
    isEmailErrorForForgotPassword.value = false;
    return null;
  }

  String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      isUserNameError.value = true;
      return "Full name is required";
    } else if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(name)) {
      isUserNameError.value = true;
      return "Full name must contain only alphabet characters";
    } else {
      isUserNameError.value = false;
    }
    return null;
  }

  String? validatePasswordForForgotPassowrd(String? password) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;€#])[A-Za-z\d@$!%*?&.*':;€#]{6,}$)";
    RegExp regExp = RegExp(pattern);
    if (password == null || password.isEmpty) {
      isPasswordErrorForForgotPassword.value = true;
      return "Password is required";
    } else if (password.length < 8 || password.length > 15) {
      isPasswordErrorForForgotPassword.value = true;
      return AppStrings.passwordValid.tr;
    } else if (!regExp.hasMatch(password)) {
      isPasswordErrorForForgotPassword.value = true;
      return "Password must contain at least one uppercase letter, one lowercase letter, one special character and one number";
    }
    isPasswordErrorForForgotPassword.value = false;
    return null;
  }

  String? validateConfirmPassword(String? password, String? cPassword) {
    if (cPassword == null || cPassword.isEmpty) {
      isPasswordErrorForConfirmForgotPassword.value = true;
      return "Password is required";
    } else if (cPassword != password) {
      isPasswordErrorForConfirmForgotPassword.value = true;
      return "Password don’t match";
    } else
      isPasswordErrorForConfirmForgotPassword.value = false;
    return null;
  }

  // String? validateName(String? name) {
  //   if (name == null || name.isEmpty) {
  //     isUserNameError.value = true;
  //     return "Full Name is required";
  //   } else {
  //     isUserNameError.value = false;
  //   }
  //   return null;
  // }

  ShowMsg(String msg, {Color? color}) {
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
      duration: const Duration(seconds: 4),
      borderRadius: 10,
      messageText: Text(
        msg,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 12.fss,
            fontFamily: "GorditaMedium"),
      ),
      margin: EdgeInsets.only(bottom: 10.ss, left: 10.ss, right: 10.ss),
    ));
  }

  void signUp() async {
    Get.closeAllSnackbars();
    if (!signUpFormKey.currentState!.validate()) {
      return;
    } else if (fullNameController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Full name is required",
        color: Colors.red,
      );
    } else if (emailController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Email id is required",
        color: Colors.red,
      );
    } else if (passwordController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Password is required",
        color: Colors.red,
      );
    } else if (isAgreeTermsAndPrivacy.value == false) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Please agree to the LightForth Terms of Service and Privacy Policy",
        color: Colors.red,
      );
    } else {
      isLoading.value = true;
      await signUpApiCall().then((result) async {
        isLoading.value = false;
        if (result is SignUpResponseModel) {
          if (result.success!) {
            ShowMsg(
              "${result.message}",
              color: Colors.green,
            );
            fullNameController.text = "";
            emailController.text = "";
            passwordController.text = "";
            Get.offAllNamed(login);
          } else {
            ShowMsg(
              "${result.message}",
              color: Colors.red,
            );
          }
        }
      });
    }
  }

  signUpApiCall() async {
    SignUpSendModel model = SignUpSendModel(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    var result = await CoreService().apiService(
      baseURL: Url.baseUrl,
      body: model.toJson(),
      method: METHOD.POST,
      endpoint: Url.signUpUrl,
    );
    return SignUpResponseModel.fromJson(result);
  }

  void logIn() async {
    Get.closeAllSnackbars();
    if (!signInFormKey.currentState!.validate()) {
      return;
    } else if (loginEmailController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Email is required",
        color: Colors.red,
      );
    } else if (loginPasswordController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Password is required",
        color: Colors.red,
      );
    } else {
      isLoading.value = true;
      await logInApiCall().then((result) async {
        isLoading.value = false;
        if (result is LoginResponseModel) {
          if (result.success!) {
            ShowMsg(
              "${result.message}",
              color: Colors.green,
            );
            await HiveStore()
                .put(Keys.accessToken, result.data!.token.toString());
            await HiveStore()
                .put(Keys.userName, result.data!.fullName.toString());
            await HiveStore()
                .put(Keys.userEmail, result.data!.email.toString());
            Get.offAllNamed(homeBottomSheetView, arguments: [HiveStore().get(Keys.userName)]);
          } else {
            ShowMsg(
              "${result.message}",
              color: Colors.red,
            );
          }
        }
      });
    }
  }

  logInApiCall() async {
    SignUpSendModel model = SignUpSendModel(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    var result = await CoreService().apiService(
      baseURL: Url.baseUrl,
      body: model.toJson(),
      method: METHOD.POST,
      endpoint: Url.loginUrl,
    );
    return LoginResponseModel.fromJson(result);
  }

  void forgotPassword(bool? isResend) async {
    Get.closeAllSnackbars();
    if (!forgotPasswordFormKey.currentState!.validate()) {
      return;
    } else if (forgotPasswordController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Email is required",
        color: Colors.red,
      );
    } else {
      if (isResend == false) {
        isLoading.value = true;
        await forgotPasswordApiCall().then((result) async {
          isLoading.value = false;
          if (result is ForgotPasswordResponseModel) {
            if (result.success!) {
              ShowMsg(
                "${result.message}",
                color: Colors.green,
              );
              temporaryTokenForForgotPassword.value = result.data?.token ?? "";
              print(
                  "Temporary Token Value:${temporaryTokenForForgotPassword.value}");
              Get.toNamed(sendLinkSuccessful,
                  arguments: [forgotPasswordController.text]);
            } else {
              ShowMsg(
                "${result.message}",
                color: Colors.red,
              );
            }
          }
        });
      } else {
        isLoadingTimer.value = true;
        await forgotPasswordApiCall().then((result) async {
          isLoadingTimer.value = false;
          if (result is ForgotPasswordResponseModel) {
            if (result.success!) {
              ShowMsg(
                "${result.message}",
                color: Colors.green,
              );
              enableResend.value = true;
              addTimer();
              temporaryTokenForForgotPassword.value = result.data?.token ?? "";
              print(
                  "Temporary Token Value:${temporaryTokenForForgotPassword.value}");
            } else {
              ShowMsg(
                "${result.message}",
                color: Colors.red,
              );
            }
          }
        });
      }
    }
  }

  forgotPasswordApiCall() async {
    ForgotPasswordSendModel model = ForgotPasswordSendModel(
      email: forgotPasswordController.text,
      role: "STUDENT",
    );
    var result = await CoreService().apiService(
      baseURL: Url.baseUrl,
      body: model.toJson(),
      method: METHOD.POST,
      endpoint: Url.forgetPasswordUrl,
    );
    return ForgotPasswordResponseModel.fromJson(result);
  }

  void verifyOTP() async {
    Get.closeAllSnackbars();
    if (!verifyOTPFormKey.currentState!.validate()) {
      return;
    } else if (verifyOTPController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "OTP is required",
        color: Colors.red,
      );
    } else {
      isLoading.value = true;
      await verifyOTPApiCall().then((result) async {
        isLoading.value = false;
        if (result is VerifyOTPResponseModel) {
          if (result.success!) {
            Get.toNamed(newPassword);
            ShowMsg(
              "${result.message}",
              color: Colors.green,
            );
            temporaryTokenForForgotPassword.value =
                "Bearer ${result.data?.token ?? ""}";
          } else {
            ShowMsg(
              "${result.message}",
              color: Colors.red,
            );
          }
        }
      });
    }
    isLoading.value = false;
  }

  verifyOTPApiCall() async {
    VerifyOTPSendModel model = VerifyOTPSendModel(
      otp: verifyOTPController.text,
    );
    HeaderModel headerModel = HeaderModel(
      token: "Bearer ${temporaryTokenForForgotPassword.value}",
    );
    var result = await CoreService().apiService(
      header: headerModel.toHeader(),
      baseURL: Url.baseUrl,
      body: model.toJson(),
      method: METHOD.POST,
      endpoint: Url.verifyOTPUrl,
    );
    return VerifyOTPResponseModel.fromJson(result);
  }

  void createNewPassword() async {
    Get.closeAllSnackbars();
    if (!createNewPasswordFormKey.currentState!.validate()) {
      return;
    } else if (createNewPasswordController.text.isEmpty ||
        createNewConfirmPasswordController.text.isEmpty) {
      Get.closeAllSnackbars();
      ShowMsg(
        "Both field is required",
        color: Colors.red,
      );
    } else {
      isLoading.value = true;
      await createNewPasswordApiCall().then((result) async {
        isLoading.value = false;
        if (result is CreateNewPasswordResponseModel) {
          if (result.success!) {
            Get.offAllNamed(login);
            ShowMsg(
              "${result.message}",
              color: Colors.green,
            );
          } else {
            ShowMsg(
              "${result.message}",
              color: Colors.red,
            );
          }
        }
      });
    }
    isLoading.value = false;
  }

  createNewPasswordApiCall() async {
    CreateNewPasswordSendModel model = CreateNewPasswordSendModel(
      password: createNewPasswordController.text,
    );
    HeaderModel headerModel = HeaderModel(
      token: temporaryTokenForForgotPassword.value,
    );
    var result = await CoreService().apiService(
      header: headerModel.toHeader(),
      baseURL: Url.baseUrl,
      body: model.toJson(),
      method: METHOD.POST,
      endpoint: Url.createNewPassword,
    );
    return CreateNewPasswordResponseModel.fromJson(result);
  }
}
