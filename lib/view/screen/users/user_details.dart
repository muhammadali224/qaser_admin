import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/user_details_controller.dart';
import '../../../core/extension/date_extension.dart';
import '../../../core/extension/space_extension.dart';
import '../../widget/users/sort_popuo_menu.dart';
import '../../widget/users/user_details_section.dart';
import '../../widget/users/users_header_pie.dart';

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
            onSelected: (val) => controller.selectOptionList(val, context),
            icon: const Icon(Icons.settings, color: Colors.blue),
          )
        ],
      ),
      body: ListView(
        children: [
          const UserHeaderPie(),
          20.height,
          const Divider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          UserDetailsSection(
              title: 'الاسم', subtitle: controller.userModel!.usersName!),
          UserDetailsSection(
              title: 'البريد الالكتروني',
              subtitle: controller.userModel!.usersEmail!),
          UserDetailsSection(
              title: 'تاريخ إنشاء الحساب',
              subtitle: controller.userModel!.usersCreate!.parseDate()),
          UserDetailsSection(
              title: 'حالة الحساب', subtitle: controller.getUserState()),
          UserDetailsSection(
              title: 'رقم الهاتف', subtitle: controller.userModel!.usersPhone!),
          GetBuilder<UserDetailsController>(builder: (controller) {
            return UserDetailsSection(
                title: 'النقاط', subtitle: controller.pointCount.toString());
          }),
          UserDetailsSection(
              title: 'عدد الطلبات الكلي',
              subtitle: controller.userModel!.ordersCount.toString()),
          UserDetailsSection(
              title: 'سعر الطلبات الكلي',
              subtitle: controller.userModel!.totalsPrice.toString()),
        ],
      ),
    );
  }
}
