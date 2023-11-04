import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/user_details_controller.dart';
import '../../widget/users/sort_popuo_menu.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    UserDetailsController controller = Get.put(UserDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.userModel!.usersName!),
        actions: [
          SortPopUpMenu(
            optionMenu: controller.optionMenu,
            onSelected: (val) => controller.selectOptionList(val),
            icon: const Icon(Icons.settings, color: Colors.blue),
          )
        ],
      ),
      body: Container(),
    );
  }
}
