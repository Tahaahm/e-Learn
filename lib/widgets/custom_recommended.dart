// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';

class CustomRecommended extends StatelessWidget {
  const CustomRecommended(
      {Key? key,
      required this.imgPath,
      required this.name,
      required this.videos})
      : super(key: key);
  final String imgPath;
  final String name;
  final int videos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: textWhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ]),
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 15),
            child: Column(
              children: [
                Container(
                  height: spacer + 40,
                  width: spacer + 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(spacer),
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(imgPath), fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: primary.withOpacity(0.7),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                      color: primary),
                  child: Text(
                    videos.toString() + "Videos",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: primary,
                          ),
                          Text(
                            " 1400",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
