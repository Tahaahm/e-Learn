// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:e_learn_second/auth/repo/code_repo.dart';
import 'package:e_learn_second/models/code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeController extends GetxController {
  final CodeRepo codeRepo;

  CodeController({required this.codeRepo});
  List<dynamic> _popularList = [];
  List<dynamic> get popularList => _popularList;

  Future<void> getCodeController() async {
    Response response = await codeRepo.getCodeRepo();

    if (response.statusCode == 200) {
      print(_popularList);
      _popularList = [];
      _popularList.addAll(Product.fromJson(response.body).product);
    }
    update();
  }
}
