// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

import 'package:e_learn_second/Providers/user_provider.dart';
import 'package:e_learn_second/pages/explore_page.dart';
import 'package:e_learn_second/pages/home_page.dart';
import 'package:e_learn_second/pages/play_page.dart';
import 'package:e_learn_second/pages/design_page.dart';
import 'package:e_learn_second/pages/user_page.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFlooter(),
      body: IndexedStack(
        index: pageIndex,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Homepage(),
          PlayPage(),
          ExplorePage(),
          UserPage(),
        ],
      ),
    );
  }

  Widget getFlooter() {
    List items = [
      "assets/images/home_icon.svg",
      "assets/images/play_icon.svg",
      "assets/images/rocket_icon.svg",
      "assets/images/user_icon.svg"
    ];
    var size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      // ignore: prefer_const_literals_to_create_immutables
      decoration: BoxDecoration(color: textWhite, boxShadow: [
        BoxShadow(
          color: textBlack,
          offset: Offset(0, 3),
          blurRadius: 10,
        ),
      ]),
      child: Row(
        children: List.generate(
          items.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: InkWell(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SvgPicture.asset(
                      items[index],
                      color: pageIndex == index ? primary : secondary,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    height: spacer - 40,
                  ),
                  pageIndex == index
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            height: 3,
                            width: 20,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
