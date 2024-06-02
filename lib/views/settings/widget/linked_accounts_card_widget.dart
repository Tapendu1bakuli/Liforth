// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';

import '../controller/settings_controller.dart';
import 'bullet_widget.dart';

class LinkedAccountsCardWidget extends StatelessWidget {
  String accountIcon;
  String account;
  Function() ontap;
  LinkedAccountsCardWidget(
      {Key? key,
      required this.accountIcon,
      required this.account,
      required this.ontap})
      : super(key: key);
  SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 20.ss),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(accountIcon),
                Container(width: 10.ss),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(account,
                        style: TextStyle(
                            color: const Color(0xFF121212),
                            fontSize: 16.fss,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GorditaMedium')),
                    Text("Jan 2, 2024 • 11:00 AM CST",
                        style: TextStyle(
                            color: const Color(0xFF121212),
                            fontSize: 12.fss,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gordita')),
                  ],
                ),
              ],
            ),
            Container(
              height: 20.ss,
            ),
            _settingsController.isExpand.value
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                        "You have granted the following access to the service",
                        style: TextStyle(
                            color: const Color(0xFF506375),
                            fontSize: 10.fss,
                            fontFamily: 'Gordita')),
                  )
                : const Offstage(),
            _settingsController.isExpand.value
                ? BulletList(const [
                    'Use the email address associated with your account ',
                    'Use your name and photo',
                  ])
                : const Offstage(),
            InkWell(
              onTap: ontap,
              child: Row(
                children: [
                  Container(
                    width: 40.ss,
                  ),
                  Text("Show more",
                      style: TextStyle(
                          color: const Color(0xFF121212),
                          fontSize: 12.fss,
                          fontFamily: 'Gordita')),
                  _settingsController.isExpand.value
                      ? const Icon(Icons.keyboard_arrow_up)
                      : const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ),
            // Theme(
            //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            //   child: ExpansionTile(
            //     childrenPadding: EdgeInsets.zero,
            //     title: Text("Show more",style: TextStyle(
            //         color: Color(0xFF121212),
            //         fontSize: 12.fss,
            //         fontFamily: 'Gordita')),
            //     children: [

            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
