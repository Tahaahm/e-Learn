// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_print

import 'package:e_learn_second/auth/controllers/try_controller.dart';
import 'package:e_learn_second/data/category_button.dart';
import 'package:e_learn_second/data/category_scrol.dart';
import 'package:e_learn_second/routes/routes.dart';

import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button.dart';
import 'package:e_learn_second/widgets/custom_button_title.dart';
import 'package:e_learn_second/widgets/custom_json_card_without.dart';
import 'package:e_learn_second/widgets/custom_scrolable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({Key? key, required this.pageId}) : super(key: key);
  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product = Get.find<TryController>().popularList[pageId];
    print(pageId);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: spacer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: primary.withOpacity(0.7),
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: textWhite,
                      ),
                    ),
                  ),
                  Text(
                    product.name!,
                    style: TextStyle(fontSize: 22),
                  ),
                  Icon(
                    Icons.list,
                    color: textBlack,
                  ),
                ],
              ),
              SizedBox(
                height: smallSpacer,
              ),
              CustomButtonTitle(
                text: "Feature Course",
                exten: false,
              ),
              SizedBox(
                height: smallSpacer,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    product.categories.length,
                    (index) => InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.getDesignDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        child: CustomJsonCardWithout(
                          imagePath: product.categories[index].videos!,
                          videos: product.categories[index].numberImage!,
                          title: product.categories[index].title!,
                          price: product.categories[index].price!,
                          name: product.categories[index].name!,
                          imgl: product.categories[index].img!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spacer,
              ),
              CustomButtonTitle(
                text: "Popular Topic",
                exten: false,
              ),
              SizedBox(
                height: smallSpacer,
              ),
              Container(
                width: 400,
                child: Wrap(
                    children: List.generate(
                  categoryButton.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    child: CustomButton(
                      text: categoryButton[index]["title"],
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: smallSpacer,
              ),
              CustomButtonTitle(
                text: "All Course",
                exten: false,
              ),
              SizedBox(
                height: spacer,
              ),
              Column(
                children: List.generate(
                  categoryScr.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomScrolable(
                      imagePath: categoryScr[index]['image'],
                      exp: categoryScr[index]['title'],
                      subtitle: categoryScr[index]['lan'],
                      price: categoryScr[index]['price'],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
