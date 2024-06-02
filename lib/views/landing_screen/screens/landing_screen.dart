// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../utils/colors/app_colors.dart';
import '../widgets/landing_widget.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: LandingWidget(
          bgColor: AppColors.whiteColor,
          themeColor: AppColors.primaryColor,
          skipClicked: (value) async {
            // print("Skip");
            // await HiveStore().initBox();
            // await HiveStore().put(Keys.landingShow, "true");
            // Get.offAllNamed(signIn);
          },
          pages: pages,
          getStartedClicked: (value) async {
            // await HiveStore().initBox();
            // await HiveStore().put(Keys.landingShow, "true");
            // Get.offAndToNamed(signIn);
            // print("Get Started");
          },
        ));
  }

  final pages = [
    LandingWidgetModel(
        id: 1,
        title: "Easy to Access",
        description:
            "Learn easily with LightForth,  you can \naccess many Courses and Coaches",
        imagePath: "asset/images/LandingOne.svg",
        iconPath: "asset/images/L1Icon.svg"),
    LandingWidgetModel(
        id: 2,
        title: "Learn from Everywhere",
        description:
            "You can learn from anywhere at \nanytime,  just connect to the internet",
        imagePath: "asset/images/LandingTwo.svg",
        iconPath: "asset/images/L2Icon.svg"),
    LandingWidgetModel(
        id: 3,
        title: "Best Coaches",
        description:
            "Find the best Coach in their \nrespective fields and branches",
        imagePath: "asset/images/LandingThree.svg",
        iconPath: "asset/images/L3Icon.svg"),
  ];
}
