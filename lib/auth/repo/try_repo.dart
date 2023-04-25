import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/routes/constant.dart';
import 'package:get/get.dart';

class TryRepo extends GetxService {
  final ApiClient apiClient;

  TryRepo({required this.apiClient});

  Future<Response> getTryRepo() async {
    return await apiClient.getData(AppConstant.TRY_POP);
  }
}
