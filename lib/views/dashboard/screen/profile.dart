// ignore_for_file: deprecated_member_use, sort_child_properties_last, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:sizing/sizing.dart';
import '../controller/home_controller.dart';
import '../widget/ongoing_course_widget.dart';

class ProfileScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(children: [
                  Container(height: 359), // Max stack size
                  Container(
                    alignment: Alignment.topCenter,
                    height: 130,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 359.ss,
                    child: Material(
                      color: const Color(0xFF581859),
                      elevation: 8.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0.ss, vertical: 24.ss),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'GorditaBold',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 157.ss,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.all(8.ss),
                                    width: 40.ss,
                                    height: 40.ss,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF701771),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      "asset/images/chat.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 17.ss,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 40.ss,
                                    height: 40.ss,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF701771),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.notifications_none_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 31.ss,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: const ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2023/01/28/20/23/ai-generated-7751688_1280.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                Container(
                                  width: 15.ss,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emeka Adebayo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.fss,
                                        fontFamily: 'GorditaBold',
                                      ),
                                    ),
                                    Container(
                                      height: 4.ss,
                                    ),
                                    Text(
                                      'emekaadebayo@gmail.com',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.fss,
                                        fontFamily: 'Gordita',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 31.ss,
                            ),
                            Container(
                              width: 327.ss,
                              child: TextButton(
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.fss,
                                      fontFamily: 'Gordita',
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.all(15)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                              side: const BorderSide(
                                                  color: Color(0xFFEAF0F5))))),
                                  onPressed: () {
                                    Get.toNamed(settingsScreen);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                Container(
                  height: Get.height,
                ),
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 5.0,
                        children: List.generate(
                            _homeController.profileGridList.length, (index) {
                          return Center(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 24.0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.ss, vertical: 20.ss),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _homeController
                                        .profileGridList[index].topWidget,
                                    Container(height: 29.ss),
                                    _homeController
                                        .profileGridList[index].bottomText,
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
            Container(
              height: 31.35.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
              child: Text(
                "Badges",
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 16.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
            ),
            Container(
              height: 25.65.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
              child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 5.0,
                  children: List.generate(
                      _homeController.profileBadgesGridList.length, (index) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _homeController.profileBadgesGridList[index].badges,
                        ],
                      ),
                    );
                  })),
            ),
            Container(
              height: 35.65.ss,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.ss),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ongoing Courses",
                    style: TextStyle(
                      color: const Color(0xFF111A24),
                      fontSize: 16.fss,
                      fontFamily: 'GorditaBold',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: const Color(0xFF581859),
                        fontSize: 12.fss,
                        fontFamily: 'Gordita',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.ss,
            ),
            OngoingCourse(
                image:
                    "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600",
                courseName: "Advance Trading : Forex Trading/Stock Trading",
                courseOwnerName: "Courtney Henry",
                onTapToContinue: () {},
                percentage: 52),
            Container(
              height: 150.ss,
            ),
          ],
        ),
      ),
    );
  }
}
