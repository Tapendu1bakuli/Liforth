// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';

class HomeTopContainerWidget extends StatelessWidget {
  String icon;
  String title;
  String subtitle;
  Function() onTap;
  bool isColoured;
  HomeTopContainerWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.isColoured})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: isColoured
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFFD4A7E6), Color(0xFFAC58D0)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFFFBF7FD), Color(0xFFFBF7FD)]),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.ss, vertical: 12.ss),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            Container(
              height: 10.ss,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.fss, fontFamily: "GorditaMedium"),
            ),
            Container(
              height: 10.ss,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12.fss, fontFamily: "Gordita"),
            ),
          ],
        ),
      ),
    );
  }
}
