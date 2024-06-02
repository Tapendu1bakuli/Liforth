import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../routers/route_constants.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/widgets_utils/app_button.dart';
import '../controller/authentication_controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    print("EnableReend:${_authenticationController.enableResend}");
    var email = Get.arguments;
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
        title: Text("Verification Code",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
      body: Form(
        key: _authenticationController.verifyOTPFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24.ss,
              ),
              RichText(
                maxLines: 2,
                text: TextSpan(
                  text: "Please enter the OTP we sent to your email address ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  children: <TextSpan>[
                    TextSpan(
                        text: email[0],
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(
                height: 32.ss,
              ),
              PinCodeTextField(
                showCursor: false,
                appContext: context,
                pastedTextStyle: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.w700,
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : const Color(0xFF111A24),
                    // color: Colors.black,
                    fontSize: 22.fss),
                length: 5,
                obscureText: false,
                backgroundColor: Theme.of(context).focusColor,
                hapticFeedbackTypes: HapticFeedbackTypes.heavy,
                useHapticFeedback: true,
                pinTheme: PinTheme(
                  activeColor: AppColors.primaryColor,
                  selectedFillColor: Theme.of(context).focusColor,
                  selectedColor: themeProvider.darkTheme
                      ? Color(0xFF506375)
                      : Color(0xFFEAF0F5),
                  activeFillColor: Theme.of(context).focusColor,
                  inactiveFillColor: Theme.of(context).focusColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  inactiveColor: themeProvider.darkTheme
                      ? Color(0xFF506375)
                      : Color(0xFFEAF0F5),
                  fieldHeight: 56,
                  fieldWidth: 56,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                enablePinAutofill: true,
                controller: _authenticationController.verifyOTPController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                },
              ),
              // RequireTextField(type: Type.otp),
              Container(
                height: 32.ss,
              ),
              Obx(
                () => _authenticationController.isLoading.value
                    ? Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: themeProvider.darkTheme
                              ? Colors.white
                              : AppColors.primaryColor,
                          size: 30.ss,
                        ),
                      )
                    : AppButton(
                        onPressed: () {
                          _authenticationController.verifyOTP();
                          // Get.toNamed(newPassword);
                          print(
                              "OTP:${_authenticationController.verifyOTPController.text}");
                        },
                        buttonText: "Verify",
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
              Container(
                height: 24.ss,
              ),
             Obx(()=>_authenticationController.enableResend.value?Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Resend OTP in ",
                     style: TextStyle(
                         color: themeProvider.darkTheme
                             ? Colors.white
                             : const Color(0xFF111A24),
                         fontSize: 14.fss,
                         fontFamily: 'Gordita')),
                 Text("${_authenticationController.secondsRemaining} seconds",
                     style: TextStyle(
                         color: const Color(0xFF581859),
                         fontSize: 14.fss,
                         fontFamily: 'GorditaBold')),
               ],
             ):Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Didn’t receive the code? ",
                     style: TextStyle(
                         color: themeProvider.darkTheme
                             ? Colors.white
                             : const Color(0xFF111A24),
                         fontSize: 14.fss,
                         fontFamily: 'Gordita')),
                _authenticationController.isLoadingTimer.value?Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : AppColors.primaryColor,
                    size: 30.ss,
                  ),
                ): InkWell(
                   onTap: () {
                    _authenticationController.forgotPassword(true);
                   },
                   child: Text("Resend",
                       style: TextStyle(
                           color: const Color(0xFF581859),
                           fontSize: 14.fss,
                           fontFamily: 'GorditaBold')),
                 ),
               ],
             ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
