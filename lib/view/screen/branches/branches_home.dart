import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/branches_controller/branches_home_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';

class BranchesHome extends StatelessWidget {
  const BranchesHome({super.key});

  @override
  Widget build(BuildContext context) {
    BranchesHomeController controller = Get.put(BranchesHomeController());
    return Scaffold(
      drawer: const AppDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CurvedHeader(
            title: 'branches',
            background: AppColor.red,
            widget: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 30,
              crossAxisSpacing: 40,
              children: [
                ItemDashBoard(
                    onTap: controller.goToView,
                    title: 'viewBranch',
                    icon: Icons.view_list_outlined,
                    background: Colors.amber),
                ItemDashBoard(
                  onTap: controller.goToAddBranch,
                  title: 'add',
                  icon: Icons.add,
                  background: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
