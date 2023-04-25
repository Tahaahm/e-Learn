// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:e_learn_second/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading(
      {Key? key, required this.text, required this.subtitle, this.color})
      : super(key: key);
  final String text;
  final String subtitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: textWhite),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 18, color: color),
        ),
      ],
    );
  }
}
