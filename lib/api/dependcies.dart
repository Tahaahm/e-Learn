import 'package:e_learn_second/api/api_clinet.dart';
import 'package:e_learn_second/auth/controllers/code_controller.dart';
import 'package:e_learn_second/auth/controllers/design_controller.dart';
import 'package:e_learn_second/auth/controllers/recommended_controller.dart';
import 'package:e_learn_second/auth/controllers/try_controller.dart';
import 'package:e_learn_second/auth/repo/code_repo.dart';
import 'package:e_learn_second/auth/repo/design_repo.dart';
import 'package:e_learn_second/auth/repo/recommended_repo.dart';
import 'package:e_learn_second/auth/repo/try_repo.dart';
import 'package:e_learn_second/routes/constant.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(
    () => ApiClient(appBaseUrl: AppConstant.BASE_POP),
  );
  Get.lazyPut(() => CodeRepo(apiClient: Get.find()));
  Get.lazyPut(() => DesignRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedRepo: Get.find()));
  Get.lazyPut(() => TryRepo(apiClient: Get.find()));

  Get.lazyPut(() => CodeController(codeRepo: Get.find()));
  Get.lazyPut(() => DesignContoller(designRepo: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));
  Get.lazyPut(() => TryController(tryController: Get.find()));
}
