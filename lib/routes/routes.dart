// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:e_learn_second/detials/design_details.dart';
import 'package:e_learn_second/detials/feature_course.dart';
import 'package:e_learn_second/pages/login_page.dart';
import 'package:e_learn_second/pages/main_page.dart';
import 'package:e_learn_second/pages/design_page.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String init = "/init";
  static const String mainPage = "/main-Page";
  static const String design = '/design';
  static const String featurCourse = "/feature-course";
  static const String allWidgets = "/all-widgets";
  static const String designDetails = "/design-details";

  static String getInit() => "$init";
  static String getDesign(int padeId) => "$design?pageId=$padeId";
  static String getFeatureCourse() => "$featurCourse";
  static String getMainPage() => "$mainPage";
  static String getAllWidgets() => "$allWidgets";
  static String getDesignDetails() => "$designDetails";

  static List<GetPage> route = [
    GetPage(
        name: allWidgets,
        page: () {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return MainPage();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                );
              }
              return LoginPage();
            },
          );
        }),
    GetPage(
      name: init,
      page: () => LoginPage(),
    ),
    GetPage(
      name: mainPage,
      page: () => MainPage(),
    ),
    GetPage(
        name: design,
        page: () {
          var pageId = Get.parameters['pageId'];
          return DesignPage(
            pageId: int.parse(pageId!),
          );
        }),
    GetPage(
      name: featurCourse,
      page: () => FeatureCourse(),
    ),
    GetPage(
        name: designDetails,
        page: () {
          return DesignDetails();
        })
  ];
}
