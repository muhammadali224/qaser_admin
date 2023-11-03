import 'package:get/get.dart';

import '../../data/model/users_model/users_model.dart';

class UserDetailsController extends GetxController {
  UsersModel? userModel;

  @override
  void onInit() {
    userModel = Get.arguments["model"];
    super.onInit();
  }
}
