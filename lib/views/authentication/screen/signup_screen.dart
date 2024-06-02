// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:lightforth/utils/colors/app_colors.dart';
import 'package:lightforth/utils/widgets_utils/app_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';
import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../controller/authentication_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      // appBar: AppBar(
      //   scrolledUnderElevation: 0.0,
      //   //leadingWidth: 40.ss,
      //   backgroundColor: themeProvider.darkTheme
      //       ? AppColors.darkBackgroundColor
      //       : AppColors.lightBackgroundColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      body: Form(
        key: _authenticationController.signUpFormKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(height: 20.ss,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 10.ss),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "asset/images/MainLogo.svg",
                    ),
                    SizedBox(
                      width: 5.ss,
                    ),
                    themeProvider.darkTheme
                        ? SvgPicture.asset(
                            "asset/images/LightForthWhiteText.svg",
                          )
                        : SvgPicture.asset(
                            "asset/images/LightForthWhiteText.svg",
                            color: AppColors.blackColor,
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 5.ss),
              child: Text("Sign up for an account",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF111A24),
                      fontSize: 24.fss,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GorditaBold')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 5.ss),
              child: Text(
                  "Creating an account can help you learn and \ngrow quickly.",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita')),
            ),
            SizedBox(
              height: 15.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: Text("Full Name",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GorditaBold')),
            ),
            SizedBox(
              height: 10.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: TextFormField(
                // Only
                controller: _authenticationController.fullNameController,
                keyboardType: TextInputType.name,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _authenticationController.validateName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: "Enter your full name",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "asset/images/userIcon.svg",
                        color: _authenticationController.isUserNameError.value
                            ? const Color(0xFFE8503A)
                            : themeProvider.darkTheme
                                ? const Color(0xFF6C7E8E)
                                : AppColors.primaryColor,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color(0xFFE8503A),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color(0xFFE8503A),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: Text("Email",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GorditaBold')),
            ),
            SizedBox(
              height: 10.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: TextFormField(
                controller: _authenticationController.emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _authenticationController.validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Obx(() => Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          "asset/images/mailIcon.svg",
                          color: _authenticationController.isEmailError.value
                              ? const Color(0xFFE8503A)
                              : themeProvider.darkTheme
                                  ? const Color(0xFF6C7E8E)
                                  : AppColors.primaryColor,
                        ),
                      )),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color(0xFFE8503A),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color(0xFFE8503A),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: Text("Password",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GorditaBold')),
            ),
            SizedBox(
              height: 10.ss,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.ss,
                ),
                child: TextFormField(
                  controller: _authenticationController.passwordController,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  maxLines: 1,
                  cursorColor: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                  validator: _authenticationController.validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? AppColors.whiteColor
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  obscureText:
                      _authenticationController.signUpPasswordIndicator.value,
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                        color: const Color(0xFF6C7E8E),
                        fontSize: 14.fss,
                        fontFamily: 'Gordita'),
                    errorStyle: TextStyle(
                        color: const Color(0xFFE8503A),
                        fontSize: 12.fss,
                        fontFamily: 'Gordita'),
                    suffixIcon: Obx(
                      () => IconButton(
                        focusColor: Colors.white,
                        splashColor: Colors.white,
                        icon: _authenticationController
                                .signUpPasswordIndicator.value
                            ? Icon(
                                Icons.visibility_off,
                                color: _authenticationController
                                        .isPasswordError.value
                                    ? const Color(0xFFE8503A)
                                    : themeProvider.darkTheme
                                        ? const Color(0xFF6C7E8E)
                                        : AppColors.primaryColor,
                                size: 24.ss,
                              )
                            : Icon(
                                Icons.visibility,
                                color: _authenticationController
                                        .isPasswordError.value
                                    ? const Color(0xFFE8503A)
                                    : themeProvider.darkTheme
                                        ? const Color(0xFF6C7E8E)
                                        : AppColors.primaryColor,
                                size: 24.ss,
                              ),
                        onPressed: () {
                          _authenticationController
                                  .signUpPasswordIndicator.value =
                              !_authenticationController
                                  .signUpPasswordIndicator.value;
                        },
                      ),
                    ),
                    prefixIcon: Obx(() => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "asset/images/passwordIcon.svg",
                            color:
                                _authenticationController.isPasswordError.value
                                    ? const Color(0xFFE8503A)
                                    : themeProvider.darkTheme
                                        ? const Color(0xFF6C7E8E)
                                        : AppColors.primaryColor,
                          ),
                        )),
                    contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: themeProvider.darkTheme
                              ? const Color(0xFF506375)
                              : const Color(0xFFEAF0F5),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: themeProvider.darkTheme
                              ? const Color(0xFF506375)
                              : const Color(0xFFEAF0F5),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color(0xFFE8503A),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color(0xFFE8503A),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.ss,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => Checkbox(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      value: _authenticationController
                          .isAgreeTermsAndPrivacy.value,
                      onChanged: (e) {
                        _authenticationController.isAgreeTermsAndPrivacy.value =
                            !_authenticationController
                                .isAgreeTermsAndPrivacy.value;
                      },
                      activeColor: AppColors.primaryColor,
                      checkColor: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(termsAndConditions);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                            text: "I agree to the LightForth ",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : const Color(0xFF454545),
                              fontSize: 14.fss,
                              fontFamily: 'Gordita',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Terms of Service \n",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Get.toNamed(termsAndConditions);
                                    },
                                  style: TextStyle(
                                    color: themeProvider.darkTheme
                                        ? const Color(0xFFE3C7EF)
                                        : AppColors.primaryColor,
                                    fontSize: 14.fss,
                                    fontFamily: 'GorditaBold',
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 3.ss,
                        ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                            text: "and ",
                            style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? AppColors.whiteColor
                                  : const Color(0xFF454545),
                              fontSize: 14.fss,
                              fontFamily: 'Gordita',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Privacy Policy",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Get.toNamed(privacyPolicy);
                                    },
                                  style: TextStyle(
                                    color: themeProvider.darkTheme
                                        ? const Color(0xFFE3C7EF)
                                        : AppColors.primaryColor,
                                    fontSize: 14.fss,
                                    fontFamily: 'GorditaBold',
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.ss,
            ),
            Obx(
              () => _authenticationController.isLoading.value
                  ? LoadingAnimationWidget.fourRotatingDots(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : AppColors.primaryColor,
                      size: 30.ss,
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.ss,
                      ),
                      child: AppButton(
                        onPressed: () {
                          _authenticationController.signUp();
                        },
                        buttonText: "Sign Up",
                        color: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        borderRadious: 40,
                        borderWidth: 1,
                        elevation: 0,
                        hight: 50.ss,
                        textStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14.fss,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GorditaBold',
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 25.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.ss,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: .38.sw,
                    height: 1, // Thickness
                    color: themeProvider.darkTheme
                        ? const Color(0xFF506375)
                        : const Color(0xFFEAF0F5),
                  ),
                  Text(
                    "   or   ",
                    style: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita',
                    ),
                  ),
                  Container(
                    width: .38.sw,
                    height: 1, // Thickness
                    color: themeProvider.darkTheme
                        ? const Color(0xFF506375)
                        : const Color(0xFFEAF0F5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.ss,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "asset/images/gmail.svg",
                    height: 20.ss,
                  ),
                  SvgPicture.asset(
                    "asset/images/linkdin.svg",
                    height: 20.ss,
                  ),
                  SvgPicture.asset(
                    "asset/images/facebook.svg",
                    height: 20.ss,
                  ),
                  SvgPicture.asset(
                    "asset/images/apple.svg",
                    height: 25.ss,
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35.ss,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  maxLines: 2,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFF6F8FA)
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Get.offAllNamed(login);
                            },
                          style: TextStyle(
                            color: themeProvider.darkTheme
                                ? const Color(0xFFE3C7EF)
                                : AppColors.primaryColor,
                            fontSize: 14.fss,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GorditaBold',
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.ss,
            ),
          ],
        ),
      ),
    );
  }
}
