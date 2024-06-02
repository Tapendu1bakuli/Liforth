import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../../utils/colors/app_colors.dart';
class AIMockScreen extends StatelessWidget {
  const AIMockScreen({Key? key}) : super(key: key);

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
        centerTitle: true,
        title: Text("AI Mock",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
    );
  }
}
