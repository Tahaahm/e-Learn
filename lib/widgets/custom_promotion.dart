// ignore_for_file: prefer_const_constructors

import 'package:e_learn_second/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPromotion extends StatelessWidget {
  const CustomPromotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * .45,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Get 60% off ",
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Exclusive for UI/UX \n Designing",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textWhite.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/images/dog_reading_vector.svg",
                  height: 100,
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: primary,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: primary,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Text(
                "Entoll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
