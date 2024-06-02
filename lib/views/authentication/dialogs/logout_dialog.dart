import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:lightforth/utils/colors/app_colors.dart';
import 'package:sizing/sizing.dart';

import '../../../stores/hive_store.dart';
import '../../../stores/share_store.dart';

showAlertDialogForLogOut() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(left: 10.ss, bottom: 180.ss, right: 10.ss),
      titlePadding: EdgeInsets.only(top: 21.0.ss, bottom: 48.ss, left: 240.ss),
      contentPadding: EdgeInsets.zero,
      title: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.close,
          color: Color(0xFF828282),
        ),
      ),
      elevation: 0.0,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(24.ss),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 12.ss,
                ),
                const Text(
                  'Logout',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111A24),
                    fontSize: 18,
                    fontFamily: 'Gordita',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                    letterSpacing: 0.20,
                  ),
                ),
                Container(
                  height: 25.ss,
                ),
                const Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6C7E8E),
                    fontSize: 14,
                    fontFamily: 'Gordita',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: 0.20,
                  ),
                ),
                Container(
                  height: 30.ss,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0.ss),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 56.ss,
                        width: 134.ss,
                        child: ElevatedButton(
                          onPressed: () async {
                            await Get.deleteAll(force: true);
                            await HiveStore().delete(Keys.accessToken);
                            await HiveStore().delete(Keys.userName);
                            await HiveStore().delete(Keys.userEmail);
                            ShareStore().clear();
                            Get.offAllNamed(login);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 19, horizontal: 40),
                              backgroundColor: AppColors.primaryColor),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Gordita',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 15.ss,
                      ),
                      SizedBox(
                        height: 56.ss,
                        width: 134.ss,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            "No",
                            style: Get.textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontFamily: "NunitoSansBold",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35.ss,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
