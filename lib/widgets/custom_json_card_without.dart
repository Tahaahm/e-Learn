// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';

class CustomJsonCardWithout extends StatelessWidget {
  const CustomJsonCardWithout(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.videos,
      required this.name,
      required this.price,
      required this.imgl})
      : super(key: key);
  final String imagePath;
  final String title;
  final int videos;
  final String name;
  final String price;
  final String imgl;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.height * 0.32,
      decoration: BoxDecoration(
          color: textWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(1, 3),
            )
          ]),
      child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Column(
            children: [
              //image
              Container(
                width: double.maxFinite,
                height: size.height * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: textWhite.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          videos.toString() + " Videos",
                          style: TextStyle(color: textBlack, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15, top: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: NetworkImage(imgl), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(name),
                  Expanded(child: Container()),
                  Text(
                    "\$ ${price}" + ".00",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
