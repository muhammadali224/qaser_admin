import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/app_drawer_controller/app_drawer_controller.dart';
import '../../widget/app_drawer/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppDrawerController controller = Get.put(AppDrawerController());
    return Drawer(
      shadowColor: Colors.red,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      width: Get.width / 1.5,
      elevation: 10,
      child: ListView(
        children: [
          DrawerItem(
            title: 'home',
            icon: Icons.home_outlined,
            onTap: controller.goToHome,
          ),
          DrawerItem(
            title: 'branches',
            icon: Icons.business,
            onTap: controller.goToBranches,
          ),
          DrawerItem(
            title: 'الادمن',
            icon: Icons.admin_panel_settings_rounded,
            onTap: controller.goToAdminUser,
          ),
          DrawerItem(
            title: 'users',
            icon: FontAwesome.user,
            onTap: controller.goToUsers,
          ),
          DrawerItem(
            title: 'cashUser',
            icon: Icons.monetization_on,
            onTap: controller.goToCashUser,
          ),
          DrawerItem(
            title: 'categories',
            icon: IconBroken.Category,
            onTap: controller.goToCategories,
          ),
          DrawerItem(
            title: 'notification',
            icon: IconBroken.Notification,
            onTap: controller.goToNotification,
          ),
          DrawerItem(
            title: 'offersImage',
            icon: FontAwesome.images,
            onTap: controller.goToOffersImage,
          ),
          DrawerItem(
            title: 'coupons',
            icon: IconBroken.Discount,
            onTap: controller.goToCoupons,
          ),
          DrawerItem(
            title: 'SMS',
            icon: IconBroken.Message,
            onTap: controller.goToSMS,
          ),
        ],
      ),
    );
  }
}
