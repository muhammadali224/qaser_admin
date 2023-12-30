import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/items_point_controller/view_item_points_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/extension/date_extension.dart';
import '../../../core/extension/space_extension.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../app_drawer/app_drawer.dart';

class ViewItemsPoint extends StatelessWidget {
  const ViewItemsPoint({super.key});

  @override
  Widget build(BuildContext context) {
    ViewItemsPointController controller = Get.put(ViewItemsPointController());
    return Scaffold(
      floatingActionButton: FAB(
        onTap: controller.goToAddItemsPoint,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getItemsPoint(),
        child: Column(
          children: [
            const CurvedHeader(title: 'awards', background: Colors.lightBlue),
            Expanded(
              child:
                  GetBuilder<ViewItemsPointController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: controller.itemsPointList
                          .map((e) => Container(
                                width: double.infinity,

                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 0.3),
                                ),
                                // height: 350,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: AppLink.imagesItemsPoint +
                                          e.itemsPointImage!,
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                    10.height,
                                    Text(e.itemsPointNameAr!,
                                        style: const TextStyle(fontSize: 20)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text("تاريخ الانتهاء"),
                                        Text(
                                            e.itemsPointExpireDate!.parseDate())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text("العدد الكلي"),
                                        Text(e.itemsPointCount.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text("مرات الاستبدال"),
                                        Text(e.itemsPointUserReplacment
                                            .toString())
                                      ],
                                    ),
                                    10.height,
                                    Row(
                                      children: [
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () => controller.updateActive(
                                              e.itemsPointIsActive == 1 ? 0 : 1,
                                              e.itemsPointId!),
                                          child: Container(
                                            height: 40,
                                            width: double.infinity,
                                            color: Colors.blueGrey,
                                            child: Icon(
                                                e.itemsPointIsActive == 1
                                                    ? FontAwesome
                                                        .lock_open_solid
                                                    : FontAwesome.lock_solid,
                                                color: e.itemsPointIsActive == 1
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                        )),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () => controller.deleteItems(
                                              e.itemsPointId!,
                                              e.itemsPointImage!),
                                          child: Container(
                                            height: 40,
                                            width: double.infinity,
                                            color: Colors.red,
                                            child: const Icon(Icons.delete,
                                                color: Colors.white),
                                          ),
                                        )),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
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
