import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/view_items_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_dashboard.dart';
import '../../widget/shred_component/popup_edit_delete.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    ViewItemController controller = Get.put(ViewItemController());
    return Scaffold(
      floatingActionButton: FAB(onTap: () => controller.goToAddItems()),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getItems(),
        child: Column(
          children: [
            CurvedHeader(
                title: controller.categoriesModel.categoriesNameAr!,
                background: Colors.purple),
            Expanded(
              child: GetBuilder<ViewItemController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 30,
                    children: [
                      ...List.generate(
                        controller.itemsList.length,
                        (index) => Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            ItemDashBoard(
                                onTap: () {},
                                title: controller.itemsList[index].itemsNameAr!,
                                subtitle: controller.itemsList[index].itemsPrice
                                    .toString(),
                                imageUrl:
                                    "${AppLink.imagesItems}${controller.itemsList[index].itemsImage}",
                                background: Colors.amber),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: PopMenuEditDelete(
                                  onEditTap: () => controller.goToEditItem(
                                      controller.itemsList[index]),
                                  onDeleteTap: () => controller.deleteItems(
                                      controller.itemsList[index].itemsId!)),
                            ),
                          ],
                        ),
                      )
                    ],
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