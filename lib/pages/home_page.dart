// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_constructors_in_immutables, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn_second/Providers/user_provider.dart';
import 'package:e_learn_second/auth/controllers/design_controller.dart';
import 'package:e_learn_second/auth/controllers/try_controller.dart';
import 'package:e_learn_second/data/category_button.dart';
import 'package:e_learn_second/data/category_card.dart';
import 'package:e_learn_second/data/json_card.dart';
import 'package:e_learn_second/models/users.dart';
import 'package:e_learn_second/pages/design_page.dart';
import 'package:e_learn_second/routes/routes.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button.dart';
import 'package:e_learn_second/widgets/custom_button_title.dart';
import 'package:e_learn_second/widgets/custom_category_card.dart';
import 'package:e_learn_second/widgets/custom_clipper.dart';
import 'package:e_learn_second/widgets/custom_heading.dart';
import 'package:e_learn_second/widgets/custom_json_card.dart';
import 'package:e_learn_second/widgets/custom_promotion.dart';
import 'package:e_learn_second/widgets/custom_search_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String username = "";
  late String _image = "";
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/data/all.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _readData();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
      _image = (snap.data() as Map<String, dynamic>)['photoUrl'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                    width: size.width,
                    height: 300,
                    color: secondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: appPadding, left: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: spacer + 24,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CustomHeading(
                              text: username == null ? "Hi" : "Hi,$username",
                              subtitle: "Let's start Learning",
                              color: textWhite,
                            ),
                            Container(
                              height: spacer,
                              width: spacer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: _image == null
                                      ? NetworkImage(
                                          "https://img.lovepik.com/free-png/20210928/lovepik-hand-drawn-cartoon-rocket-png-image_401716595_wh1200.png")
                                      : NetworkImage(_image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1100),
                        child: CustomSearchField(
                          hintText: "Try ,Web Design",
                        ),
                      ),
                      SizedBox(
                        height: spacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1100),
                        child:
                            GetBuilder<TryController>(builder: ((controller) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.popularList.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteHelper.getDesign(index));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        child: CustomCategoryCard(
                                            imagePath: controller
                                                .popularList[index].icon,
                                            title: controller
                                                .popularList[index].name),
                                      ),
                                    )),
                          );
                        })),
                      ),
                      SizedBox(
                        height: spacer,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1300),
                          child: CustomPromotion()),
                      SizedBox(
                        height: spacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: CustomButtonTitle(
                          text: "Feature Course",
                        ),
                      ),
                      SizedBox(
                        height: smallSpacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                JsonCard.length,
                                (index) => InkWell(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.featurCourse);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10, right: 10),
                                        child: CustomJsonCard(
                                          imagePath: JsonCard[index]['image'],
                                          videos: JsonCard[index]['videos'],
                                          title: JsonCard[index]['title'],
                                          price: JsonCard[index]['price'],
                                          name: JsonCard[index]['name'],
                                          imgl: JsonCard[index]['imgl'],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: spacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: CustomButtonTitle(
                          text: "Categories ",
                        ),
                      ),
                      SizedBox(
                        height: miniSpacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              categoryButton.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: CustomButton(
                                  text: categoryButton[index]["title"],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1750),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              categoryButtonSecond.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: CustomButton(
                                  text: categoryButtonSecond[index]["title"],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: miniSpacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: CustomButtonTitle(
                          text: "Design Course ",
                        ),
                      ),
                      SizedBox(
                        height: smallSpacer,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child:
                            GetBuilder<DesignContoller>(builder: ((controller) {
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                controller.popularList.length < 4
                                    ? controller.popularList.length
                                    : 3,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  child: CustomJsonCard(
                                    imagePath:
                                        controller.popularList[index].img,
                                    videos:
                                        controller.popularList[index].videos,
                                    title: controller.popularList[index].title,
                                    price: controller.popularList[index].price,
                                    name: controller.popularList[index].name,
                                    imgl: controller.popularList[index].imgl,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
