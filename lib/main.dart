// ignore_for_file: prefer_const_constructors

import 'package:e_learn_second/auth/controllers/code_controller.dart';
import 'package:e_learn_second/auth/controllers/design_controller.dart';
import 'package:e_learn_second/auth/controllers/recommended_controller.dart';
import 'package:e_learn_second/auth/controllers/try_controller.dart';
import 'package:e_learn_second/auth/repo/code_repo.dart';
import 'package:e_learn_second/auth/repo/design_repo.dart';
import 'package:e_learn_second/auth/repo/recommended_repo.dart';
import 'package:e_learn_second/auth/repo/try_repo.dart';
import 'package:e_learn_second/pages/home_page.dart';
import 'package:e_learn_second/pages/login_page.dart';
import 'package:e_learn_second/pages/main_page.dart';
import 'package:e_learn_second/routes/routes.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learn_second/api/dependcies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CodeController>().getCodeController();
    Get.find<CodeRepo>().getCodeRepo();
    Get.find<DesignContoller>().getDesignController();
    Get.find<DesignRepo>().getDesingRepo();
    Get.find<RecommendedController>().getRecommendedController();
    Get.find<RecommendedRepo>().getRecommendedRepo();
    Get.find<TryController>().getTryController();
    Get.find<TryRepo>().getTryRepo();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "WorkSans",
        primarySwatch: Colors.blue,
      ),
      getPages: RouteHelper.route,
      initialRoute: RouteHelper.allWidgets,
    );
  }
}
