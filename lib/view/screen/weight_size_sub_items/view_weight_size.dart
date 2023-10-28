import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/weight_size_controller/view_weight_size_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';

class ViewWeightSize extends StatelessWidget {
  const ViewWeightSize({super.key});

  @override
  Widget build(BuildContext context) {
    WeightSizeViewController controller = Get.put(WeightSizeViewController());
    return Scaffold(
      floatingActionButton: FAB(
        onTap: controller.goToAddSubItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getSubItems(),
        child: Column(
          children: [
            const CurvedHeader(title: 'weightSize', background: Colors.indigo),
            Expanded(
              child:
                  GetBuilder<WeightSizeViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.weightSizeList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        title: controller.weightSizeList[index].subItemNameAr!,
                        subtitle: controller.weightSizeList[index].subItemValue
                            .toString(),
                        onEditTap: () => controller
                            .goToEditSubItem(controller.weightSizeList[index]),
                        onDeleteTap: () => controller.deleteSubItem(
                            controller.weightSizeList[index].weightSizeId!),
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
