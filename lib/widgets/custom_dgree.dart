// ignore_for_file: prefer_const_constructors

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';

class CutomDgree extends StatelessWidget {
  const CutomDgree(
      {Key? key,
      required this.imagePath,
      required this.exp,
      required this.subtitle,
      required this.price,
      required this.percent})
      : super(key: key);
  final String imagePath;
  final String exp;
  final String subtitle;
  final String price;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 120,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 5),
            height: spacer + 10,
            width: spacer + 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    exp,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: grey.withOpacity(0.4),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 7,
                                width: percent * 2,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: primary.withOpacity(0.4),
                                      blurRadius: 10,
                                      offset: Offset(0, -1),
                                    ),
                                    BoxShadow(
                                      color: primary.withOpacity(0.4),
                                      blurRadius: 10,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  color: primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "\$ ${price}",
                        style: TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
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
