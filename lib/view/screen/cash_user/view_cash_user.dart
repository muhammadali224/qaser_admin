import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/cash_user_controller/view_cash_user_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/get_branch_name.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_list_tile.dart';

class ViewCashUser extends StatelessWidget {
  const ViewCashUser({super.key});

  @override
  Widget build(BuildContext context) {
    CashUserViewController controller = Get.put(CashUserViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToAddCashUser,
        label: Text("addCashUser".tr),
        icon: const Icon(FontAwesome.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          CurvedHeader(
            title: 'cashUser',
            background: Colors.deepPurple,
            widget: GetBuilder<CashUserViewController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cashUserList.length,
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
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
