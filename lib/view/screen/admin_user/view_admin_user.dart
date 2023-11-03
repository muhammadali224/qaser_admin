import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin_user_controller/view_admin_user_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/get_branch_name.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';
import '../app_drawer/app_drawer.dart';

class ViewAdminUser extends StatelessWidget {
  const ViewAdminUser({super.key});

  @override
  Widget build(BuildContext context) {
    AdminUserViewController controller = Get.put(AdminUserViewController());
    return Scaffold(
      floatingActionButton: FAB(onTap: controller.goToAddAdminUser),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getAdminUsers(),
        child: Column(
          children: [
            const CurvedHeader(title: 'Admins', background: Colors.teal),
            Expanded(
              child: GetBuilder<AdminUserViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.adminUserList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        subtitle: controller.adminUserList[index].adminEmail!,
                        title:
                            "${controller.adminUserList[index].adminName!}, ${getBranchName(controller.adminUserList[index].adminBranchId!)} ",
                        onEditTap: () => controller
                            .goToEditAdminUser(controller.adminUserList[index]),
                        onDeleteTap: () => controller.deleteAdminUser(
                            controller.adminUserList[index].adminId!),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
