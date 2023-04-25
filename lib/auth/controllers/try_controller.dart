// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:e_learn_second/auth/repo/try_repo.dart';
import 'package:e_learn_second/models/try_model.dart';
import 'package:get/get.dart';

class TryController extends GetxController {
  final TryRepo tryController;

  TryController({required this.tryController});

  List<dynamic> _populatList = [];
  List<dynamic> get popularList => _populatList;

  Future<void> getTryController() async {
    Response response = await tryController.getTryRepo();
    if (response.statusCode == 200) {
      print("Whats up" + _populatList.toString());
      _populatList = [];
      _populatList.addAll(ProductTry.fromJson(response.body).product);
    }
    update();
  }
}
