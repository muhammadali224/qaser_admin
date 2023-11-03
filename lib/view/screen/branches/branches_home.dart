import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/branches_controller/branch_view_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../data/source/shared/branch_list.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';
import '../app_drawer/app_drawer.dart';

class BranchesHome extends StatelessWidget {
  const BranchesHome({super.key});

  @override
  Widget build(BuildContext context) {
    BranchViewController controller = Get.put(BranchViewController());
    return Scaffold(
      floatingActionButton: FAB(onTap: controller.goToAddBranch),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.homeController.getBranches(),
        child: Column(
          children: [
            CurvedHeader(title: 'branches', background: AppColor.red),
            Expanded(
              child: GetBuilder<BranchViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: branchList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        title: branchList[index].branchNameAr!,
                        subtitle: branchList[index].branchPhone1!,
                        onEditTap: () =>
                            controller.goToEditBranch(branchList[index]),
                        onDeleteTap: () => controller
                            .deleteBranch(branchList[index].branchId!),
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
