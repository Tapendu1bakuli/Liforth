// ignore_for_file: must_be_immutable, deprecated_member_use, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/percent_indicator/circular_percent_indicator.dart';
import '../../authentication/dialogs/logout_dialog.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsController _settingsController = Get.put(SettingsController());

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
        title: Text("Settings",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.ss),
        child: ListView(
          children: [
            Container(height: 12.ss),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.ss, vertical: 15.ss),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/Frames.png"),
                        fit: BoxFit.cover)),
                child: Row(
                  children: [


                    Container(
                      width: 20.ss,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Completed!",
                            style: TextStyle(
                                fontFamily: "GorditaBold",
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          Text(
                            "A complete profile increases the chances of a recruiter being more interested in recruiting you.",
                            style: TextStyle(
                                fontFamily: "GorditaMedium",
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 24.ss,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/Show.svg"),
                title: Text("Job Seeking Status",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            Container(
              height: 12.ss,
            ),
            Text("Account",
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : const Color(0xFF616161),
                    fontSize: 16.fss,
                    fontFamily: 'GorditaBold')),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Get.toNamed(editProfile);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/Profile.svg"),
                title: Text("Edit Profile",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Get.toNamed(linkedAccounts);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/Swap.svg"),
                title: Text("Linked Accounts",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            Container(
              height: 12.ss,
            ),
            Text("General",
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : const Color(0xFF616161),
                    fontSize: 16.fss,
                    fontFamily: 'GorditaBold')),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/Notification.svg"),
                title: Text("Notification",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/ShieldDone.svg"),
                title: Text("Security",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 18.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset("asset/images/MoreCircle.svg"),
                  Container(
                    width: 18.ss,
                  ),
                  Text("Language",
                      style: TextStyle(
                          color: themeProvider.darkTheme
                              ? Colors.white
                              : const Color(0xFF212121),
                          fontSize: 18.fss,
                          fontFamily: 'GorditaBold')),
                  const Spacer(),
                  Text("English (US)",
                      style: TextStyle(
                          color: themeProvider.darkTheme
                              ? Colors.white
                              : const Color(0xFF212121),
                          fontSize: 18.fss,
                          fontFamily: 'GorditaBold')),
                  Container(
                    width: 20.ss,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF212121),
                  ),
                ],
              ),
            ),
            Container(
              height: 30.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset("asset/images/Show.svg"),
                  Container(
                    width: 18.ss,
                  ),
                  Text("Dark Mode",
                      style: TextStyle(
                          color: themeProvider.darkTheme
                              ? Colors.white
                              : const Color(0xFF212121),
                          fontSize: 18.fss,
                          fontFamily: 'GorditaBold')),
                  const Spacer(),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: const Color(0xFF581859),
                      value: _settingsController.switchValue.value,
                      onChanged: (value) {
                        _settingsController.switchValue.value = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 18.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/InfoSquare.svg"),
                title: Text("Help Center",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/User.svg"),
                title: Text("Invite Friends",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            Container(
              height: 12.ss,
            ),
            Text("About",
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? Colors.white
                        : const Color(0xFF616161),
                    fontSize: 16.fss,
                    fontFamily: 'GorditaBold')),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/ShieldDone.svg"),
                title: Text("Privacy & Policy",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/Password.svg"),
                title: Text("Terms of Services",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset("asset/images/InfoSquare.svg"),
                title: Text("About us",
                    style: TextStyle(
                        color: themeProvider.darkTheme
                            ? Colors.white
                            : const Color(0xFF212121),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF212121),
                ),
                leading: SvgPicture.asset(
                  "asset/images/InfoSquare.svg",
                  color: const Color(0xFFF75555),
                ),
                title: Text("Deactivate My Account",
                    style: TextStyle(
                        color: const Color(0xFFF75555),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 12.ss,
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                showAlertDialogForLogOut();
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(
                  "asset/images/Logout.svg",
                  color: const Color(0xFFF75555),
                ),
                title: Text("Logout",
                    style: TextStyle(
                        color: const Color(0xFFF75555),
                        fontSize: 18.fss,
                        fontFamily: 'GorditaBold')),
              ),
            ),
            Container(
              height: 20.ss,
            ),
          ],
        ),
      ),
    );
  }
}
