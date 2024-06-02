import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/widgets_utils/app_button.dart';
import '../controller/authentication_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        //leadingWidth: 40.ss,
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        leading: InkWell(
          onTap: () {
            Get.offAllNamed(login);
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
        title: Text("Forgot Password",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.ss, vertical: 40.ss),
        child: Obx(
          () => _authenticationController.isLoading.value
              ? LoadingAnimationWidget.fourRotatingDots(
                  color: themeProvider.darkTheme
                      ? Colors.white
                      : AppColors.primaryColor,
                  size: 30.ss,
                )
              : AppButton(
                  onPressed: () {
                    _authenticationController.forgotPassword(false);
                  },
                  buttonText: "Send email",
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
      body: Form(
        key: _authenticationController.forgotPasswordFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.ss,
              ),
              Center(
                child: themeProvider.darkTheme
                    ? SvgPicture.asset(
                        "asset/images/forgotPasswordIcon.svg",
                        height: 119.ss,
                      )
                    : SvgPicture.asset(
                        "asset/images/forgotPasswordTopLogo.svg",
                        height: 119.ss,
                      ),
              ),
              Container(
                height: 24.ss,
              ),
              Text("Reset your password",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : const Color(0xFF111A24),
                      fontSize: 24.fss,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GorditaBold')),
              Container(
                height: 12.ss,
              ),
              Text("We will send you an email to reset your password",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita')),
              Container(
                height: 24.ss,
              ),
              Text("Email",
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
              TextFormField(
                controller: _authenticationController.forgotPasswordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                validator:
                    _authenticationController.validateEmailForForgotPassword,
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
                          color: _authenticationController
                                  .isEmailErrorForForgotPassword.value
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
            ],
          ),
        ),
      ),
    );
  }
}
