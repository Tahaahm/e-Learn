// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:e_learn_second/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonTitle extends StatelessWidget {
  const CustomButtonTitle({Key? key, required this.text, this.exten = true})
      : super(key: key);
  final String text;
  final bool exten;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: secondary),
        ),
        (exten)
            ? Text(
                "See More",
                style: TextStyle(
                  color: primary,
                ),
              )
            : Container(),
      ],
    );
  }
}
