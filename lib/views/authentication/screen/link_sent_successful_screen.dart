import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../routers/route_constants.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/widgets_utils/app_button.dart';

class LinkSentSuccessful extends StatelessWidget {
  const LinkSentSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = Get.arguments;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 20.ss),
        child: AppButton(
          onPressed: () {
            Get.toNamed(verificationCodeScreen, arguments: [email[0]]);
          },
          buttonText: "Proceed",
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            themeProvider.darkTheme
                ? SvgPicture.asset(
                    "asset/images/linkSendSuccessfullyDarkTheme.svg",
                    // height: 20.ss,
                  )
                : SvgPicture.asset(
                    "asset/images/linkSendSuccessfullyLightTheme.svg",
                    height: 119.ss,
                  ),
            Container(
              height: 56.ss,
            ),
            Text("Your OTP has been sent!",
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : const Color(0xFF111A24),
                    fontSize: 22.fss,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GorditaBold')),
            Container(
              height: 16.ss,
            ),
            Container(
              width: 315.ss,
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'We have sent an OTP to \n',
                          style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? const Color(0xFFC4D2DF)
                                  : const Color(0xFF6C7E8E),
                              fontSize: 14.fss,
                              fontFamily: 'Gordita')),
                      TextSpan(
                        text: "${email[0]}.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? const Color(0xFFC4D2DF)
                                : const Color(0xFF6C7E8E),
                            fontSize: 14.fss,
                            fontFamily: 'GorditaMedium'),
                      ),
                      TextSpan(
                          text: ' Please check your email.',
                          style: TextStyle(
                              color: themeProvider.darkTheme
                                  ? const Color(0xFFC4D2DF)
                                  : const Color(0xFF6C7E8E),
                              fontSize: 14.fss,
                              fontFamily: 'Gordita')),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
