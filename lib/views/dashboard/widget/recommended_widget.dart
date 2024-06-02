import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../service/rating/rating_bar.dart';
import '../../../utils/colors/app_colors.dart';
class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: themeProvider.darkTheme?Color(0xFF1F2D3B):Colors.white),
        width: 239.ss,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width:239.ss,child: Image.asset("asset/images/Rectangle_463.png",fit: BoxFit.fitWidth,)),
              Container(
                height: 15.ss,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10.0.ss),
                child: Row(
                  children: [
                    Text(
                      'UI/UX for Beginner',
                      style: TextStyle(
                        color: themeProvider.darkTheme
                            ? AppColors.whiteColor
                            : const Color(0xFF454545),
                        fontSize: 14.fss,
                        fontFamily: 'GorditaMedium',
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 24.ss,
                          width: 24.ss,
                          color: Color(0xFFE8503A),
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFFFFFFF),
                            size: 15,
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10.0.ss),
                child: Text(
                  "Hassan Bode",
                  style: TextStyle(
                      fontSize: 12.fss, fontFamily: "Gordita"),
                ),
              ),
              Container(
                height: 10.ss,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 10.0.ss),
                child: Row(
                  children: [
                    Text(
                      "\$200",
                      style: TextStyle(
                          fontSize: 16.fss,
                          fontFamily: "GorditaMedium",
                          color: themeProvider.darkTheme?Color(0xFFE3C7EF):Color(0xFF581959)),
                    ),
                    Container(
                      width: 5.ss,
                    ),
                    Text(
                      "\$310",
                      style: TextStyle(
                        fontSize: 12.fss,
                        fontFamily: "Gordita",
                        color: themeProvider.darkTheme?Color(0xFFC4D2DF):Color(0xFF6C7E8E),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 5.ss,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.ss),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar(
                      initialRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 15,
                      ratingWidget: RatingWidget(
                        full: Image.asset("asset/images/Mask-2.png",),
                        half: Image.asset("asset/images/Mask-2.png",),
                        empty: Image.asset("asset/images/Mask.png",),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Container(width: 5.ss,),
                    Text(
                      "4.9",
                      style: TextStyle(
                        fontSize: 12.fss,
                        fontFamily: "Gordita",
                        color: themeProvider.darkTheme?Color(0xFFC4D2DF):Color(0xFF6C7E8E),
                      ),
                    ),
                    Container(width: 3.ss,),
                    Container(height: 4.ss,width: 4.ss,decoration: BoxDecoration(color: Color(0xFFC4D2DF),borderRadius: BorderRadius.circular(20)),),
                    Container(width: 3.ss,),
                    Text(
                      "(12,990)",
                      style: TextStyle(
                        fontSize: 12.fss,
                        fontFamily: "Gordita",
                        color: themeProvider.darkTheme?Color(0xFFC4D2DF):Color(0xFF6C7E8E),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 10.ss,)
            ]),
      ),
    );
  }
}
