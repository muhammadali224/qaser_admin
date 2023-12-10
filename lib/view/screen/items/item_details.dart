import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../widget/items/items_details/selecte_branch_tab.dart';
import '../../widget/items/items_details/upload_images_tab.dart';
import '../../widget/items/items_details/weight_size_tab.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(controller.itemModel!.itemsNameAr!),
    //   ),
    //   body: GetBuilder<ItemsDetailsController>(builder: (controller) {
    //     return HandlingDataView(
    //       statusRequest: controller.statusRequest,
    //       widget: ListView(
    //         children: [
    //           ExpansionPanelList(
    //             expansionCallback: (int index, bool isExpanded) {
    //               controller.changeExpanded(index);
    //             },
    //             children: [
    //               ExpansionPanel(
    //                 headerBuilder: (BuildContext context, bool isExpanded) {
    //                   return const ListTile(title: Text('الفروع'));
    //                 },
    //                 body: ListView.builder(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemBuilder: (context, index) => CheckboxListTile(
    //                     title: Text(
    //                       getBranchName(branchList[index].branchId!)!,
    //                       style: const TextStyle(color: Colors.black),
    //                     ),
    //                     value: controller.itemModel!.branchIds
    //                         ?.contains(branchList[index].branchId.toString()),
    //                     onChanged: (bool? value) {
    //                       controller.editAvailableInBranch(
    //                           branchList[index].branchId!, value!);
    //                     },
    //                   ),
    //                   itemCount: branchList.length,
    //                 ),
    //                 isExpanded: controller.branchIsExpanded,
    //               ),
    //               ExpansionPanel(
    //                 headerBuilder: (BuildContext context, bool isExpanded) {
    //                   return const ListTile(title: Text('الاوزان والاحجام'));
    //                 },
    //                 body: ListView.builder(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemBuilder: (context, index) => CheckboxListTile(
    //                     title: Text(
    //                       subItemsList[index].subItemNameAr!,
    //                       style: const TextStyle(color: Colors.black),
    //                     ),
    //                     value: controller.itemModel!.weighIds?.contains(
    //                         subItemsList[index].weightSizeId.toString()),
    //                     onChanged: (bool? value) {
    //                       controller.editAvailableWeight(
    //                           subItemsList[index].weightSizeId!, value!);
    //                     },
    //                   ),
    //                   itemCount: subItemsList.length,
    //                 ),
    //                 isExpanded: controller.weightIsExpanded,
    //               ),
    //               ExpansionPanel(
    //                 headerBuilder: (BuildContext context, bool isExpanded) {
    //                   return const ListTile(title: Text('الصور'));
    //                 },

    return DefaultTabController(
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
    );
  }
}
