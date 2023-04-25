// ignore_for_file: prefer_const_constructors

import 'package:e_learn_second/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration:
          BoxDecoration(color: primary, borderRadius: BorderRadius.circular(15),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.6),
              blurRadius: 10,
              offset: Offset(1, 3),
            )
          ]),
      child: Text(
        text,
        style: TextStyle(
          color: textWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
