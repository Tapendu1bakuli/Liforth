import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:sizing/sizing.dart';

import '../models/home_top_container_model.dart';
import '../models/profile_badges_gridview_model.dart';
import '../models/profile_gridview_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  RxList<ProfileGridViewModel> profileGridList = [
    ProfileGridViewModel(
        topWidget: Text(
          "67",
          style: TextStyle(
            color: Color(0xFFFFB45C),
            fontSize: 30.fss,
            fontFamily: 'GorditaBold',
          ),
        ),
        bottomText: Text("Ongoing Courses",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
    ProfileGridViewModel(
        topWidget: Text(
          "67",
          style: TextStyle(
            color: Color(0xFF5DE094),
            fontSize: 30.fss,
            fontFamily: 'GorditaBold',
          ),
        ),
        bottomText: Text("Completed Courses",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
    ProfileGridViewModel(
        topWidget: SvgPicture.asset(
          "asset/images/academic-cap.svg",
          // height: 20.ss,
        ),
        bottomText: Text("Certificates",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
    ProfileGridViewModel(
        topWidget: SvgPicture.asset(
          "asset/images/badge-check.svg",
          // height: 20.ss,
        ),
        bottomText: Text("Badges",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
    ProfileGridViewModel(
        topWidget: SvgPicture.asset(
          "asset/images/document-text.svg",
          // height: 20.ss,
        ),
        bottomText: Text("Resume AI",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
    ProfileGridViewModel(
        topWidget: SvgPicture.asset(
          "asset/images/pencil-alt.svg",
          // height: 20.ss,
        ),
        bottomText: Text("Auto Apply",style: TextStyle(
          color: Color(0xFF191B20),
          fontSize: 12.fss,
          fontFamily: 'GorditaBold',
        ))),
  ].obs;
  RxList<ProfileBadgesGridViewModel> profileBadgesGridList = [
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_1.svg")),
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_2.svg")),
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_3.svg")),
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_4.svg")),
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_5.svg")),
    ProfileBadgesGridViewModel(badges: SvgPicture.asset("asset/images/badge_6.svg")),
  ].obs;
RxBool isTapped = false.obs;
  RxList<HomeTopContainerModel> homeTopContainer = [
    HomeTopContainerModel(icon: "asset/images/sparkles.svg",title: "AI Companion",subtitle: "Hi 👋 I’m Lite AI, ask me any question",onTap: (){Get.toNamed(aiCompanion);},isColoured: true,),
    HomeTopContainerModel(icon: "asset/images/document_text.svg",title: "Resume AI",subtitle: "Generate your resume in minutes",onTap: (){Get.toNamed(resumeAi);},isColoured: false),
    HomeTopContainerModel(icon: "asset/images/pencil_alt.svg",title: "Auto Apply",subtitle: "Apply for jobs more conveniently",onTap: (){Get.toNamed(autoApply);},isColoured: false),
    HomeTopContainerModel(icon: "asset/images/checklist-user.svg",title: "AI Mock",subtitle: "Prepare for interviews more effectively",onTap: (){Get.toNamed(aiMock);},isColoured: false),
  ].obs;
  RxList<String> popularTopics = ["Programming","Art","Science","Cyber Security"].obs;
}
