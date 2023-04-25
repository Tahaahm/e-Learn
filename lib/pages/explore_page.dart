// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:e_learn_second/data/category_button.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button.dart';
import 'package:e_learn_second/widgets/custom_button_title.dart';
import 'package:e_learn_second/widgets/custom_search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Text(
                "My Course",
                style: TextStyle(
                  color: textBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Let's continue,shall we",
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: spacer,
              ),
              CustomSearchField(hintText: "Try ,Web Design "),
              SizedBox(
                height: spacer,
              ),
              CustomButtonTitle(
                text: "Top Searches",
                exten: false,
              ),
              SizedBox(
                height: smallSpacer,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: 400,
                  child: Column(
                    children: [
                      Wrap(
                          children: List.generate(
                              categoryButton.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: CustomButton(
                                        text: categoryButton[index]['title']),
                                  )))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spacer,
              ),
              CustomButtonTitle(
                text: "Categories",
                exten: false,
              ),
              SizedBox(
                height: smallSpacer,
              ),
              Column(
                children: List.generate(
                  categoryButton.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categoryButton[index]['title'],
                        ),
                        SvgPicture.asset("assets/images/arrow_up_icon.svg")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
