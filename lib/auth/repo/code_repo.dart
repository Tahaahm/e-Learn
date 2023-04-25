import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/routes/constant.dart';
import 'package:get/get.dart';

class CodeRepo extends GetxService {
  final ApiClient apiClient;

  CodeRepo({required this.apiClient});

  Future<Response> getCodeRepo() async {
    return await apiClient.getData(AppConstant.POPULAR_FOOD);
  }
}
