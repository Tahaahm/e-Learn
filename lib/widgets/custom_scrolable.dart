// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';

class CustomScrolable extends StatelessWidget {
  const CustomScrolable(
      {Key? key,
      required this.imagePath,
      required this.exp,
      required this.subtitle,
      required this.price})
      : super(key: key);
  final String imagePath;
  final String exp;
  final String subtitle;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 110,
      decoration: BoxDecoration(
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 40,
            offset: Offset(2, 4),
          ),
          BoxShadow(
            color: textWhite,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, bottom: 5, top: 5),
            height: spacer + 10,
            width: spacer + 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // ignore: prefer_const_literals_to_create_immutables

              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.none,
              margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    exp,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "\$ ${price}",
                        style: TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
