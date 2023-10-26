import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/branches_controller/branch_view_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../data/source/shared/branch_list.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_list_tile.dart';

class BranchesHome extends StatelessWidget {
  const BranchesHome({super.key});

  @override
  Widget build(BuildContext context) {
    BranchViewController controller = Get.put(BranchViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToAddBranch,
        label: Text("addBranch".tr),
        icon: const Icon(FontAwesome.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          CurvedHeader(
            title: 'branches',
            background: AppColor.red,
            widget: GetBuilder<BranchViewController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  itemCount: branchList.length,
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
                        title: branchList[index].branchNameAr!,
                        subtitle: branchList[index].branchPhone1!,
                        onEditTap: () =>
                            controller.goToEditBranch(branchList[index]),
                        onDeleteTap: () => controller
                            .deleteBranch(branchList[index].branchId!),
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

//
// GridView.count(
// crossAxisCount: 2,
// shrinkWrap: true,
// mainAxisSpacing: 30,
// crossAxisSpacing: 40,
// children: [
// ItemDashBoard(
// onTap: controller.goToView,
// title: 'viewBranch',
// icon: Icons.view_list_outlined,
// background: Colors.amber),
// ItemDashBoard(
// onTap: controller.goToAddBranch,
// title: 'add',
// icon: Icons.add,
// background: Colors.red,
// ),
// ],
// )
