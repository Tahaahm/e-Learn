import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/routes/constant.dart';
import 'package:get/get.dart';

class DesignRepo extends GetxService {
  final ApiClient apiClient;

  DesignRepo({required this.apiClient});

  Future<Response> getDesingRepo() async {
    return await apiClient.getData(AppConstant.DESIGN_POP);
  }
}
