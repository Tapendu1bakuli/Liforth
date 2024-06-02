// ignore_for_file: must_be_immutable, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/utils/text_utils/text_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../utils/colors/app_colors.dart';
import '../controller/settings_controller.dart';
import '../widget/linked_accounts_card_widget.dart';

class LinkedAccounts extends StatelessWidget {
  LinkedAccounts({Key? key}) : super(key: key);
  SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
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
        title: Text(AppStrings.linkedAccounts,
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
          child: ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return LinkedAccountsCardWidget(
                  account: _settingsController.accounts[index],
                  accountIcon: _settingsController.accountsIcon[index],
                  ontap: () {
                    _settingsController.isExpand.value =
                        !_settingsController.isExpand.value;
                    print("Tapped card $index");
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 20,
              );
            },
          )),
    );
  }
}
