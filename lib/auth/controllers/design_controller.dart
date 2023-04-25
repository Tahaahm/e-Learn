// ignore_for_file: prefer_final_fields, avoid_print

import 'package:e_learn_second/auth/repo/design_repo.dart';
import 'package:e_learn_second/models/code.dart';
import 'package:get/get.dart';

class DesignContoller extends GetxController {
  final DesignRepo designRepo;

  DesignContoller({required this.designRepo});
  List<dynamic> _popularList = [];
  List<dynamic> get popularList => _popularList;
  Future<void> getDesignController() async {
    Response response = await designRepo.getDesingRepo();

    if (response.statusCode == 200) {
      _popularList = [];
      print(_popularList);

      _popularList.addAll(Product.fromJson(response.body).product);
    }
    update();
  }
}
