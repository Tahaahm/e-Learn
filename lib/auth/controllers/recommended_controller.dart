import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/auth/repo/design_repo.dart';
import 'package:e_learn_second/auth/repo/recommended_repo.dart';
import 'package:e_learn_second/models/code.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  final RecommendedRepo recommendedRepo;

  RecommendedController({required this.recommendedRepo});
  List<dynamic> _popularList = [];
  List<dynamic> get popularList => _popularList;
  Future<void> getRecommendedController() async {
    Response response = await recommendedRepo.getRecommendedRepo();

    if (response.statusCode == 200) {
      _popularList = [];
      print(_popularList);

      _popularList.addAll(Product.fromJson(response.body).product);
    }
    update();
  }
}
