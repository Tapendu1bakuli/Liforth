import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../routers/route_constants.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/widgets_utils/app_button.dart';
import '../controller/authentication_controller.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      bottomNavigationBar: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 20.ss),
          child: _authenticationController.isLoading.value
              ? LoadingAnimationWidget.fourRotatingDots(
                  color: themeProvider.darkTheme
                      ? Colors.white
                      : AppColors.primaryColor,
                  size: 30.ss,
                )
              : AppButton(
                  onPressed: () {
                    //Get.toNamed(sendLinkSuccessful,arguments: ["Emekaabebayo@gmail.com"]);
                    _authenticationController.createNewPassword();
                  },
                  buttonText: "Create Password",
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
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        //leadingWidth: 40.ss,
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        leading: InkWell(
          onTap: () {
            Get.offAllNamed(forgotPassword);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.0.ss),
            child: SvgPicture.asset(
              "asset/images/forgotPasswordAppbarLeadingBack.svg",
              // height: 20.ss,
            ),
          ),
        ),
        centerTitle: true,
        title: Text("Create New Password",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
      body: Form(
        key: _authenticationController.createNewPasswordFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.ss,
                ),
                Text("Enter your new password to re-access your account",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? const Color(0xFFC4D2DF)
                            : const Color(0xFF6C7E8E),
                        fontSize: 14.fss,
                        fontFamily: 'Gordita')),
                Container(
                  height: 3.ss,
                ),
                Text("New Password",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF111A24),
                        fontSize: 14.fss,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GorditaBold')),
                Container(
                  height: 8.ss,
                ),
                Obx(
                  () => TextFormField(
                    controller:
                        _authenticationController.createNewPasswordController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    maxLines: 1,
                    cursorColor: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    validator: _authenticationController
                        .validatePasswordForForgotPassowrd,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF111A24),
                        fontSize: 14.fss,
                        fontFamily: 'Gordita'),
                    obscureText:
                        _authenticationController.forgotPasswordIndicator.value,
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                      hintText: "Enter your new password",
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
                                  .forgotPasswordIndicator.value
                              ? Icon(
                                  Icons.visibility_off,
                                  color: _authenticationController
                                          .isPasswordErrorForForgotPassword
                                          .value
                                      ? const Color(0xFFE8503A)
                                      : themeProvider.darkTheme
                                          ? const Color(0xFF6C7E8E)
                                          : AppColors.primaryColor,
                                  size: 24.ss,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: _authenticationController
                                          .isPasswordErrorForForgotPassword
                                          .value
                                      ? const Color(0xFFE8503A)
                                      : themeProvider.darkTheme
                                          ? const Color(0xFF6C7E8E)
                                          : AppColors.primaryColor,
                                  size: 24.ss,
                                ),
                          onPressed: () {
                            _authenticationController
                                    .forgotPasswordIndicator.value =
                                !_authenticationController
                                    .forgotPasswordIndicator.value;
                          },
                        ),
                      ),
                      prefixIcon: Obx(() => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              "asset/images/passwordIcon.svg",
                              color: _authenticationController
                                      .isPasswordErrorForForgotPassword.value
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: themeProvider.darkTheme
                                ? const Color(0xFF506375)
                                : const Color(0xFFEAF0F5),
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                Container(
                  height: 16.ss,
                ),
                Text("Confirm New Password",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF111A24),
                        fontSize: 14.fss,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GorditaBold')),
                Container(
                  height: 8.ss,
                ),
                Obx(
                  () => TextFormField(
                    controller: _authenticationController
                        .createNewConfirmPasswordController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    maxLines: 1,
                    cursorColor: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    validator: (value) =>
                        _authenticationController.validateConfirmPassword(
                            _authenticationController
                                .createNewPasswordController.text,
                            _authenticationController
                                .createNewConfirmPasswordController.text),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF111A24),
                        fontSize: 14.fss,
                        fontFamily: 'Gordita'),
                    obscureText: _authenticationController
                        .forgotConfirmPasswordIndicator.value,
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                      hintText: "Enter confirm new password",
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
                                  .forgotConfirmPasswordIndicator.value
                              ? Icon(
                                  Icons.visibility_off,
                                  color: _authenticationController
                                          .isPasswordErrorForConfirmForgotPassword
                                          .value
                                      ? const Color(0xFFE8503A)
                                      : themeProvider.darkTheme
                                          ? const Color(0xFF6C7E8E)
                                          : AppColors.primaryColor,
                                  size: 24.ss,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: _authenticationController
                                          .isPasswordErrorForConfirmForgotPassword
                                          .value
                                      ? const Color(0xFFE8503A)
                                      : themeProvider.darkTheme
                                          ? const Color(0xFF6C7E8E)
                                          : AppColors.primaryColor,
                                  size: 24.ss,
                                ),
                          onPressed: () {
                            _authenticationController
                                    .forgotConfirmPasswordIndicator.value =
                                !_authenticationController
                                    .forgotConfirmPasswordIndicator.value;
                          },
                        ),
                      ),
                      prefixIcon: Obx(() => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              "asset/images/passwordIcon.svg",
                              color: _authenticationController
                                      .isPasswordErrorForConfirmForgotPassword
                                      .value
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: themeProvider.darkTheme
                                ? const Color(0xFF506375)
                                : const Color(0xFFEAF0F5),
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
