// ignore_for_file: prefer_const_constructors

import 'package:e_learn_second/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      height: size.width * 0.25,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(12),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: primary,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                imagePath,
                height: 25,
                color: textWhite,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: textBlack),
          ),
        ],
      ),
    );
  }
}
