import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lightforth/routers/route_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';
import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../utils/colors/app_colors.dart';

class LandingWidgetModel {
  String? title;
  String? description;

  String? imagePath;
  String? iconPath;
  int? id;

  LandingWidgetModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imagePath,
    @required this.iconPath,
  });
}

class LandingWidget extends StatefulWidget {
  final List<LandingWidgetModel>? pages;
  final Color? bgColor;
  final Color? themeColor;
  final ValueChanged<String>? skipClicked;
  final ValueChanged<String>? getStartedClicked;

  const LandingWidget({
    Key? key,
    @required this.pages,
    @required this.bgColor,
    @required this.themeColor,
    @required this.skipClicked,
    @required this.getStartedClicked,
  }) : super(key: key);

  @override
  LandingWidgetState createState() => LandingWidgetState();
}

class LandingWidgetState extends State<LandingWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages!.length; i++) {
      list.add(i == _currentPage ? _indicator(true, i) : _indicator(false, i));
    }
    return list;
  }

  List<Widget> buildOnboardingPages(int page, BuildContext context) {
    debugPrint("Initial Page:- $page");
    final children = <Widget>[];

    for (int i = 0; i < widget.pages!.length; i++) {
      children.add(_showPageData(widget.pages![i], context));
    }
    return children;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _indicator(bool isActive, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 3.ss),
      height: ScreenConstant.sizeDefault,
      width: isActive ? 15.ss : 15.ss,
      decoration: BoxDecoration(
        color: isActive
            ? index == 1
                ? AppColors.whiteColor
                : AppColors.primaryColor
            : AppColors.inactiveIndicator,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: AppColors.secondaryColor,
      //   elevation: 0,
      //   actions: [
      //     _currentPage != widget.pages!.length - 1
      //         ? Container(
      //             alignment: Alignment.centerRight,
      //             child: TextButton(
      //               onPressed: () {
      //                 widget.skipClicked!("Skip Tapped");
      //               },
      //               child: Text(
      //                 'Skip'.toUpperCase(),
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w400,
      //                   color: AppColors.primaryColor,
      //                   fontSize: FontSizeStatic.md,
      //                 ),
      //               ),
      //             ),
      //           )
      //         : Offstage(),
      //   ],
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: PageView(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children:
                buildOnboardingPages(_pageController.initialPage, context)),
      ),
      /*  bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : Text(''),*/
    );
  }

  Widget _showPageData(LandingWidgetModel page, BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: page.id == 1
              ? AppColors.primaryColor
              : page.id == 2
                  ? themeProvider.darkTheme
                      ? const Color(0xFF111A24)
                      : AppColors.whiteColor
                  : AppColors.primaryColor,
          child: Padding(
            padding: EdgeInsets.only(top: 150.ss),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                page.imagePath!,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: .4.sh,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: page.id == 1
                  ? themeProvider.darkTheme
                      ? const Color(0xFF111A24)
                      : AppColors.whiteColor
                  : page.id == 2
                      ? AppColors.primaryColor
                      : themeProvider.darkTheme
                          ? const Color(0xFF111A24)
                          : AppColors.whiteColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.ss,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(
                  height: 40.ss,
                ),
                Text(page.title!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: page.id == 1
                            ? themeProvider.darkTheme
                                ? AppColors.whiteColor
                                : const Color(0xFF1F2D3B)
                            : page.id == 2
                                ? AppColors.whiteColor
                                : themeProvider.darkTheme
                                    ? AppColors.whiteColor
                                    : const Color(0xFF1F2D3B),
                        fontSize: 24.fss,
                        fontFamily: 'GorditaBold')),
                SizedBox(height: 20.ss),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.ss),
                  child: Text(page.description!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: page.id == 1
                              ? themeProvider.darkTheme
                                  ? const Color(0xFFE1E9F1)
                                  : const Color(0xFF506375)
                              : page.id == 2
                                  ? AppColors.whiteColor
                                  : themeProvider.darkTheme
                                      ? const Color(0xFFE1E9F1)
                                      : const Color(0xFF506375),
                          fontSize: 16.fss,
                          fontFamily: 'Gordita')),
                ),
                SizedBox(height: .06.sh),
                page.id == 3
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed(signUp);
                        },
                        child: SvgPicture.asset(
                          "asset/images/L3Icon.svg",
                          height: 70.ss,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: SvgPicture.asset(
                          page.iconPath!,
                          height: 70.ss,
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
