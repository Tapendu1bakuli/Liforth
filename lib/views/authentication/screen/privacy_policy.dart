import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../utils/colors/app_colors.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).focusColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.0.ss),
              child: SvgPicture.asset(
                "asset/images/forgotPasswordAppbarLeadingBack.svg",
                // height: 20.ss,
              ),
            ),
          ),
          title: Text("Privacy Policy",
              style: TextStyle(
                  color: themeProvider.darkTheme
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF111A24),
                  fontSize: 24.fss,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GorditaBold')),
          //leadingWidth: 40.ss,
          backgroundColor: themeProvider.darkTheme
              ? AppColors.darkBackgroundColor
              : AppColors.lightBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.ss,horizontal: 12.ss),
          child: ListView(
            children: [
              Text( "Information Collection",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  fontFamily: 'GorditaMedium',
                ),),
              RichText(
                text: TextSpan(
                  text: "Personal Data: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "We collect personal data you provide when you register, such as your name, email address, and other contact details.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 5.ss,),
              RichText(
                text: TextSpan(
                  text: "Usage Data: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Information on how you use Lightforth, including access times, viewed pages, and courses engaged with.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 5.ss,),
              RichText(
                text: TextSpan(
                  text: "Cookies and Tracking Data: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "We use cookies to track activity on our service and hold certain information to enhance your experience.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 10.ss,),
              Text( "Use of Data",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              RichText(
                text: TextSpan(
                  text: "Service Provision: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: " To provide and maintain our Service, including monitoring the usage of our Service.Personalization: To personalize your experience and to deliver tailored content and service offerings.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 5.ss,),
              RichText(
                text: TextSpan(
                  text: "Communication: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "To contact you with newsletters, marketing or promotional materials, and other information that may be of interest to you.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 10.ss,),
              Text( "Data Sharing and Disclosure",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              RichText(
                text: TextSpan(
                  text: "Service Providers: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "We may share your data with trusted third parties who assist us in operating our website, conducting our business, or serving our users.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 5.ss,),
              RichText(
                text: TextSpan(
                  text: "Legal Requirements: ",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFC4D2DF)
                          : Colors.black,
                      fontSize: 16.fss,
                      height: 1.5,
                      fontFamily: 'GorditaMedium'),
                  children: <TextSpan>[
                    TextSpan(
                        text: "We may disclose your data when required by law or to protect the rights, property, or safety of our company, our users, or others.",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : const Color(0xFF111A24),
                            fontSize: 14.fss,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ),
              Container(height: 10.ss,),
              Text( "Data Security",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              Container(height: 5.ss,),
              Text(
                  "We value your trust in providing us with your Personal Data, and we strive to use commercially acceptable means of protecting it. However, no method of transmission over the Internet or method of electronic storage is 100% secure.",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita')),
              Container(height: 10.ss,),
              Text( "Your Rights",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              Container(height: 5.ss,),
              Text(
                  "You have the right to access, update or delete the information we have on you. Whenever made possible, you can access, update or request the deletion of your Personal Data directly within your account settings section.",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita')),
              Container(height: 10.ss,),
              Text( "Children's Privacy",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              Container(height: 5.ss,),
              Text(
                  "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13.",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita')),
              Container(height: 10.ss,),
              Text( "Changes to This Privacy Policy",
                style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : Colors.black,
                  fontSize: 20.fss,
                  height: 1.5,
                  fontFamily: 'GorditaMedium',
                ),),
              Container(height: 5.ss,),
              Text(
                  "We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.",
                  style: TextStyle(
                      color: themeProvider.darkTheme
                          ? Colors.white
                          : const Color(0xFF111A24),
                      fontSize: 14.fss,
                      height: 1.5,
                      fontFamily: 'Gordita')),
              Container(height: 10.ss,),
            ],
          ),
        )
    );
  }
}
