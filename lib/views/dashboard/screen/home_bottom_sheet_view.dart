import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/utils/colors/app_colors.dart';
import 'package:lightforth/views/dashboard/screen/ai_companion.dart';
import 'package:lightforth/views/dashboard/screen/home_screen.dart';
import 'package:lightforth/views/dashboard/screen/my_course.dart';
import 'package:lightforth/views/dashboard/screen/profile.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../controller/home_controller.dart';

// ignore: must_be_immutable
class HomeBottomNavigationScreenForPatient extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AICompanion(),
    MyCourse(),
    ProfileScreen(),
  ];

  HomeBottomNavigationScreenForPatient({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).focusColor,
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Container(
            //   height: 1.0,
            //   decoration: BoxDecoration(
            //     color: Get.theme.colorScheme.outline,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Get.theme.colorScheme.outline,
            //         spreadRadius: 1,
            //         blurRadius: 2,
            //         offset: Offset(0, 2), // changes position of shadow
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 800.ss,
              child:
                  _widgetOptions.elementAt(_homeController.selectedIndex.value),
            )
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(splashColor: Colors.transparent),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.ss),
                topLeft: Radius.circular(20.ss)),
            child: BottomNavigationBar(
              backgroundColor:
                  themeProvider.darkTheme ? Color(0xB7111A24) : Colors.white,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0.ss, bottom: 2.ss),
                    child: _homeController.selectedIndex.value == 0
                        ? SvgPicture.asset(
                            "asset/images/home_bottom.svg",
                            height: 24.ss,
                            color: AppColors.primaryColor,
                          )
                        : SvgPicture.asset(
                            "asset/images/home_bottom.svg",
                            height: 24.ss,
                            color: Color(0xffAFBDCA),
                          ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0.ss, bottom: 2.ss),
                    child: _homeController.selectedIndex.value == 1
                        ? SvgPicture.asset(
                            "asset/images/sparkles_bottom.svg",
                            height: 24.ss,
                            color: AppColors.primaryColor,
                          )
                        : SvgPicture.asset(
                            "asset/images/sparkles_bottom.svg",
                            height: 24.ss,
                            color: Color(0xffAFBDCA),
                          ),
                  ),
                  label: 'AI Companion',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0.ss, bottom: 2.ss),
                    child: _homeController.selectedIndex.value == 2
                        ? SvgPicture.asset(
                            "asset/images/play_bottom.svg",
                            height: 24.ss,
                            color: AppColors.primaryColor,
                          )
                        : SvgPicture.asset(
                            "asset/images/play_bottom.svg",
                            height: 24.ss,
                            color: Color(0xffAFBDCA),
                          ),
                  ),
                  label: 'My Course',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0.ss, bottom: 2.ss),
                    child: _homeController.selectedIndex.value == 3
                        ? SvgPicture.asset(
                            "asset/images/user_bottom.svg",
                            height: 24.ss,
                            color: AppColors.primaryColor,
                          )
                        : SvgPicture.asset(
                            "asset/images/user_bottom.svg",
                            height: 24.ss,
                            color: Color(0xffAFBDCA),
                          ),
                  ),
                  label: 'Profile',
                ),
              ],
              unselectedItemColor:
                  themeProvider.darkTheme ? Colors.white : Color(0xFF6C7E8E),
              showUnselectedLabels: true,
              unselectedFontSize: 12,
              selectedFontSize: 12,
              currentIndex: _homeController.selectedIndex.value,
              selectedItemColor: AppColors.primaryColor,
              onTap: _homeController.selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
