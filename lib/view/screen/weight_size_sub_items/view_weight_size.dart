import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/weight_size_controller/view_weight_size_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../data/source/shared/sub_item_weight_list.dart';
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
                    itemCount: subItemsList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        title: subItemsList[index].subItemNameAr!,
                        subtitle: subItemsList[index].subItemValue.toString(),
                        onEditTap: () =>
                            controller.goToEditSubItem(subItemsList[index]),
                        onDeleteTap: () => controller
                            .deleteSubItem(subItemsList[index].weightSizeId!),
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
