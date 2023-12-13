import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../../controller/items_controller/view_items_controller.dart';
import '../../widget/items/items_details/selecte_branch_tab.dart';
import '../../widget/items/items_details/upload_images_tab.dart';
import '../../widget/items/items_details/weight_size_tab.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());

    return PopScope(
      onPopInvoked: (onPOP) async {
        if (onPOP) {
          await Future.wait([
            Get.find<ViewItemController>().getItems(),
            Get.find<ViewItemController>().getSubItems(),
          ]);
        }
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.itemModel!.itemsNameAr!),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.tabController,
              tabs: const [
                Tab(icon: Icon(Icons.scale), text: "الاوزان والاحجام"),
                Tab(icon: Icon(Icons.business_rounded), text: "الفروع"),
                Tab(icon: Icon(Icons.image_outlined), text: "الصور"),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: const [
              WeightSizeTab(),
              SelectBranchTab(),
              UploadItemImagesTab(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: controller.getFloatingAction,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
