import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:lightforth/views/dashboard/controller/home_controller.dart';
import 'package:lightforth/views/dashboard/widget/home_top_container_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../service/rating/rating_bar.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/percent_indicator/circular_percent_indicator.dart';
import '../widget/ongoing_course_widget.dart';
import '../widget/recommended_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var name = Get.arguments;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.ss, horizontal: 24.ss),
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: "👋 Hi ",
                        style: TextStyle(
                            color: themeProvider.darkTheme
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF111A24),
                            fontSize: 16.fss,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GorditaBold'),
                        children: <TextSpan>[
                          TextSpan(
                              text: "${name[0]},",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {},
                              style: TextStyle(
                                color: Color(0xFFD3A7E6),
                                fontSize: 16.fss,
                                fontFamily: 'GorditaBold',
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 5.ss,
                    ),
                    Text(
                      'What are you doing today?',
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF454545),
                        fontSize: 12.fss,
                        fontFamily: 'Gordita',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(chatScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.ss),
                    height: 40.ss,
                    width: 40.ss,
                    decoration: BoxDecoration(
                        color: themeProvider.darkTheme?Color(0xFF506375):Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset(
                      "asset/images/chat.svg",color: themeProvider.darkTheme?Colors.white:Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 17.ss,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(notificationScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.ss),
                    height: 40.ss,
                    width: 40.ss,
                    decoration: BoxDecoration(
                        color: themeProvider.darkTheme?Color(0xFF506375):Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      color: themeProvider.darkTheme?Colors.white:Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20.ss,
            ),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              maxLines: 1,
              cursorColor: themeProvider.darkTheme
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () {
                Get.toNamed(searchScreen);
              },
              style: TextStyle(
                  color: themeProvider.darkTheme
                      ? AppColors.whiteColor
                      : const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'Gordita'),
              decoration: InputDecoration(
                fillColor: themeProvider.darkTheme?Color(0xFF1F2D3B):Color(0xFFF6F8FA),
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(
                    color: themeProvider.darkTheme?Color(0xFFC4D2DF):const Color(0xFF6C7E8E),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                errorStyle: TextStyle(
                    color: const Color(0xFFE8503A),
                    fontSize: 12.fss,
                    fontFamily: 'Gordita'),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: SvgPicture.asset(
                      "asset/images/search.svg",
                      color:themeProvider.darkTheme?Color(0xFFC4D2DF): AppColors.primaryColor,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: Color(0xFFF6F8FA),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: themeProvider.darkTheme
                          ? const Color(0xFF506375)
                          : const Color(0xFFEAF0F5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color: themeProvider.darkTheme
                          ? const Color(0xFF506375)
                          : const Color(0xFFEAF0F5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Color(0xFFE8503A),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Color(0xFFE8503A),
                      width: 1,
                      style: BorderStyle.solid),
                ),
              ),
            ),
            Container(
              height: 20.ss,
            ),
            Obx(
              () => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeController.homeTopContainer.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return HomeTopContainerWidget(
                    icon: _homeController.homeTopContainer[index].icon,
                    title: _homeController.homeTopContainer[index].title,
                    subtitle: _homeController.homeTopContainer[index].subtitle,
                    onTap: _homeController.homeTopContainer[index].onTap,
                    // onTap: () {
                    //   print("_homeController.isTapped.value");
                    //   _homeController.homeTopContainer.forEach((element) => element.isColoured = false);
                    //   print("index:$index");
                    //   _homeController.homeTopContainer[index].isColoured =
                    //       !_homeController.homeTopContainer[index].isColoured;
                    //   _homeController.homeTopContainer.refresh();
                    // },
                    isColoured:
                        _homeController.homeTopContainer[index].isColoured,
                  );
                },
              ),
            ),
            Container(
              height: 20.ss,
            ),
            Text(
              'Popular Topics',
              style: TextStyle(
                color: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : const Color(0xFF454545),
                fontSize: 16.fss,
                fontFamily: 'GorditaBold',
              ),
            ),
            Container(
              height: 20.ss,
            ),
            Container(
              height: 41,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.ss, vertical: 10.ss),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: Color(0xFFEAF0F5))),
                        child: Center(
                          child: Text(_homeController.popularTopics[index]),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 20.ss,
            ),
            Container(
              height: 100.ss,
              padding: EdgeInsets.symmetric(horizontal: 20.ss, vertical: 15.ss),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/home_percent_card.png"),
                      fit: BoxFit.cover)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Continue learning",
                          style: TextStyle(
                              fontFamily: "GorditaBold",
                              fontSize: 18.fss,
                              color: Color(0xFFFFFFFF)),
                        ),
                        Text(
                          "You have completed 65% of your overall courses",
                          style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 12.fss,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    arcType: ArcType.HALF,
                    radius: 35.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.6,
                    center: Text(
                      "60%",
                      style: TextStyle(
                          fontFamily: "Gordita",
                          fontSize: 12.0,
                          color: Colors.white),
                    ),
                    circularStrokeCap: CircularStrokeCap.square,
                    progressColor: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 20.ss,
            ),
            Row(
              children: [
                Text(
                  'Ongoing Courses',
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF454545),
                    fontSize: 16.fss,
                    fontFamily: 'GorditaBold',
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFE3C7EF)
                          : const Color(0xFF454545),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 10.ss,
            ),
            OngoingCourse(
                image:
                    "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600",
                courseName: "Advance Trading : Forex Trading/Stock Trading",
                courseOwnerName: "Courtney Henry",
                onTapToContinue: () {},
                percentage: 52),
            Container(
              height: 20.ss,
            ),
            Row(
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF454545),
                    fontSize: 16.fss,
                    fontFamily: 'GorditaBold',
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: themeProvider.darkTheme
                          ? const Color(0xFFE3C7EF)
                          : const Color(0xFF454545),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20.ss,
            ),
            Container(
              height: 260,
              color: Theme.of(context).focusColor,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return RecommendedWidget();
                  }, separatorBuilder: (BuildContext context, int index) {
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 10.ss));
              },),
            ),
            Container(
              height: 100.ss,
            ),
          ],
        ),
      ),
    );
  }
}
