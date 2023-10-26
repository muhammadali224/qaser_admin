import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app_drawer_controller/app_drawer_controller.dart';
import '../app_drawer/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppDrawerController controller = Get.put(AppDrawerController());
    return Drawer(
      shadowColor: Colors.red,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      width: Get.width / 2,
      elevation: 10,
      child: ListView(
        children: [
          DrawerItem(
            title: 'home',
            icon: Icons.home_outlined,
            onTap: controller.goToHome,
          ),
          DrawerItem(
            title: 'Admins',
            icon: Icons.admin_panel_settings_rounded,
            onTap: controller.goToAdminUser,
          ),
          DrawerItem(
            title: 'cashUser',
            icon: Icons.monetization_on,
            onTap: controller.goToCashUser,
          ),
          DrawerItem(
            title: 'branches',
            icon: Icons.business,
            onTap: controller.goToBranches,
          ),
        ],
      ),
    );
  }
}
