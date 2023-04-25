// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:e_learn_second/auth/controllers/recommended_controller.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button_title.dart';
import 'package:e_learn_second/widgets/custom_recommended.dart';
import 'package:e_learn_second/widgets/custom_search_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureCourse extends StatelessWidget {
  const FeatureCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textWhite,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    'Hi,' + "Taha",
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/769525/pexels-photo-769525.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: textWhite.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3345882/pexels-photo-3345882.jpeg?auto=compress&cs=tinysrgb&w=600",
                        ),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          blurRadius: 10,
                          offset: Offset(0, 5))
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start\nLearning",
                          style: TextStyle(
                              color: textWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomSearchField(
                          hintText: "What you want to learn",
                          exist: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacer,
              ),
              CustomButtonTitle(text: "Recommended"),
              SizedBox(
                height: spacer,
              ),
              GetBuilder<RecommendedController>(builder: ((controller) {
                return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.popularList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 230),
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: CustomRecommended(
                            imgPath: controller.popularList[index].imgl!,
                            name: controller.popularList[index].name!,
                            videos: controller.popularList[index].videos!),
                      );
                    }));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
