// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../utils/percent_indicator/linear_percent_indicator.dart';

class OngoingCourse extends StatelessWidget {
  String? image;
  String? courseName;
  String? courseOwnerName;
  Function()? onTapToContinue;
  int? percentage;
  OngoingCourse(
      {Key? key,
      required this.courseName,
      required this.courseOwnerName,
      required this.image,
      required this.onTapToContinue,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return  Center(

      child: Container(
        width: 327.ss,
        padding: EdgeInsets.symmetric(horizontal: 24.ss, vertical: 24.ss),
        decoration: ShapeDecoration(
          color: themeProvider.darkTheme?Color(0xFF1F2D3B):Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 40,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      height: 64.ss,
                      width: 64.ss,
                      child: Image.network(
                        image ?? "",
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: 12.ss,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseName ?? "",
                        style: TextStyle(
                          color: Color(0xFF111A24),
                          fontSize: 14.fss,
                          fontFamily: 'GorditaMedium',
                        ),
                      ),
                      Text(
                        courseOwnerName ?? "",
                        style: TextStyle(
                          color: Color(0xFF6C7E8E),
                          fontSize: 12.fss,
                          fontFamily: 'Gordita',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 11.ss,
            ),
            Row(
              children: [
                Text("Course is in progress",style: TextStyle(
                  color: themeProvider.darkTheme?const Color(0xFFE1E9F1):const Color(0xFF6C7E8E),
                  fontSize: 12.fss,
                  fontFamily: 'Gordita',
                ),),
                Spacer(),
                Text("$percentage%",style: TextStyle(
                  color: themeProvider.darkTheme?const Color(0xFFE1E9F1):const Color(0xFF6C7E8E),
                  fontSize: 12.fss,
                  fontFamily: 'Gordita',
                ),),

              ],
            ),
            LinearPercentIndicator(
              animation: false,
              lineHeight: 6.0,
              percent: percentage! / 100,
              padding: EdgeInsets.zero,
              linearGradient: LinearGradient(
                colors: themeProvider.darkTheme?<Color>[Color(0xFFE3C7EF), Color(0xFFE3C7EF)]:<Color>[Color(0xFF581959), Color(0xFF581959)],
              ),
              linearGradientBackgroundColor: LinearGradient(
                colors: <Color>[Color(0xffe5d6fa), Color(0xffc8dff8)],
              ),
            ),
            Container(
              height: 13.ss,
            ),
            InkWell(
              onTap: onTapToContinue,

              child: Text("Continue Course",style: TextStyle(
                color: themeProvider.darkTheme?Color(0xFFE3C7EF):Color(0xFF581859),
                fontSize: 14.fss,
                fontFamily: 'GorditaBold',
              ),),

            ),
          ],
        ),
      ),
    );
  }
}
