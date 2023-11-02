import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../controller/items_controller/item_details_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/get_branch_name.dart';
import '../../../core/function/pick_image.dart';
import '../../../data/source/shared/branch_list.dart';
import '../../../data/source/shared/sub_item_weight_list.dart';
import '../../widget/shred_component/material_button.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.itemModel!.itemsNameAr!),
      ),
      body: GetBuilder<ItemsDetailsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  controller.changeExpanded(index);
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(title: Text('الفروع'));
                    },
                    body: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CheckboxListTile(
                        title: Text(
                          getBranchName(branchList[index].branchId!)!,
                          style: const TextStyle(color: Colors.black),
                        ),
                        value: controller.itemModel!.branchIds
                            ?.contains(branchList[index].branchId.toString()),
                        onChanged: (bool? value) {
                          controller.editAvailableInBranch(
                              branchList[index].branchId!, value!);
                        },
                      ),
                      itemCount: branchList.length,
                    ),
                    isExpanded: controller.branchIsExpanded,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(title: Text('الاوزان والاحجام'));
                    },
                    body: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CheckboxListTile(
                        title: Text(
                          subItemsList[index].subItemNameAr!,
                          style: const TextStyle(color: Colors.black),
                        ),
                        value: controller.itemModel!.weighIds?.contains(
                            subItemsList[index].weightSizeId.toString()),
                        onChanged: (bool? value) {
                          controller.editAvailableWeight(
                              subItemsList[index].weightSizeId!, value!);
                        },
                      ),
                      itemCount: subItemsList.length,
                    ),
                    isExpanded: controller.weightIsExpanded,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(title: Text('الصور'));
                    },
                    body: ListView.builder(
                      itemCount: controller.itemModel!.images!.length + 1,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? InkWell(
                                onTap: () async {
                                  controller.file =
                                      await pickImage(ImageSource.gallery);
                                  if (controller.file != null) {
                                    controller.addItemImage();
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: InstaImageViewer(
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "${AppLink.imagesItems}${controller.itemModel!.images![index - 1]}"),
                                    ),
                                  ),
                                  MaterialCustomButton(
                                    onPressed: () => controller.deleteItemImage(
                                        controller
                                            .itemModel!.images![index - 1]),
                                    title: 'delete',
                                    color: Colors.red,
                                  )
                                ],
                              );
                      },
                    ),
                    isExpanded: controller.imagesIsExpanded,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
