// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({Key? key, required this.hintText, this.exist = true})
      : super(key: key);
  final String hintText;
  final bool exist;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: spacer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            "assets/images/search_icon.svg",
            height: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Container(
              height: 38,
              child: TextField(
                cursorColor: textBlack,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 5, bottom: 10),
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: grey,
                  ),
                ),
              ),
            ),
          ),
          (exist)
              ? Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: primary,
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ]),
                  child: SvgPicture.asset("assets/images/filter_icon.svg"),
                )
              : Container(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
