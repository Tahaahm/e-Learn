import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/routes/constant.dart';
import 'package:get/get.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedRepo({required this.apiClient});

  Future<Response> getRecommendedRepo() async {
    return await apiClient.getData(AppConstant.RECOMMENDED_POP);
  }
}
