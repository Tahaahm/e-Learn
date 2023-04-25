// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:e_learn_second/auth/controllers/try_controller.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_scrolable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignDetails extends StatelessWidget {
  const DesignDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 55),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(50),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.6),
                          blurRadius: 10,
                          offset: Offset(1, 3),
                        )
                      ]),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: textWhite,
                  ),
                ),
              ),
              SizedBox(
                height: smallSpacer,
              ),
              Column(
                children: List.generate(
                  24,
                  (index) => CustomScrolable(
                      imagePath:
                          "https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&w=600",
                      exp: "dsmkmksdasdasmd",
                      subtitle: "4.3",
                      price: "30.0"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
