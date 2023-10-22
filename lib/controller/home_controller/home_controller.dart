import 'package:get/get.dart';

import '../../core/services/services.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;

  @override
  void onInit() async {
    // myServices.sharedPref.clear(); //
    await userManagement.getUser();
    adminData = userManagement.user;

    super.onInit();
  }
}
