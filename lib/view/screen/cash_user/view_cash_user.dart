import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cash_user_controller/view_cash_user_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/get_branch_name.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';
import '../app_drawer/app_drawer.dart';

class ViewCashUser extends StatelessWidget {
  const ViewCashUser({super.key});

  @override
  Widget build(BuildContext context) {
    CashUserViewController controller = Get.put(CashUserViewController());
    return Scaffold(
      floatingActionButton: FAB(onTap: controller.goToAddCashUser),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getCashUsers(),
        child: Column(
          children: [
            const CurvedHeader(
                title: 'cashUser', background: Colors.deepPurple),
            Expanded(
              child: GetBuilder<CashUserViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.cashUserList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        subtitle: controller.cashUserList[index].cashUserEmail!,
                        title:
                            "${controller.cashUserList[index].cashUserName!}, ${getBranchName(controller.cashUserList[index].cashBranchId!)} ",
                        onEditTap: () => controller
                            .goToEditCashUser(controller.cashUserList[index]),
                        onDeleteTap: () => controller.deleteCashUser(
                            controller.cashUserList[index].cashSystemId!),
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
