import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/admin_user_controller/view_admin_user_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_list_tile.dart';

class ViewAdminUser extends StatelessWidget {
  const ViewAdminUser({super.key});

  @override
  Widget build(BuildContext context) {
    AdminUserViewController controller = Get.put(AdminUserViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToAddAdminUser,
        label: Text("addAdmin".tr),
        icon: const Icon(FontAwesome.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          CurvedHeader(
            title: 'Admins',
            background: Colors.teal,
            widget: GetBuilder<AdminUserViewController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.adminUserList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Material(
                      color: Colors.white,
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topRight: Radius.circular(100))
                          : null,
                      elevation: 15,
                      child: ItemListTile(
                        subtitle: controller.adminUserList[index].adminEmail!,
                        title:
                            "${controller.adminUserList[index].adminName!}, ${controller.getBranchName(controller.adminUserList[index].adminBranchId!)} ",
                        onEditTap: () => controller
                            .goToEditAdminUser(controller.adminUserList[index]),
                        onDeleteTap: () => controller.deleteAdminUser(
                            controller.adminUserList[index].adminId!),
                      ),
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
