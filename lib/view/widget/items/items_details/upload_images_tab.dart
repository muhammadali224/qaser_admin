import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../../controller/items_controller/item_details_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../shred_component/material_button.dart';

class UploadItemImagesTab extends GetView<ItemsDetailsController> {
  const UploadItemImagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.itemModel!.images!.length,
          itemBuilder: (_, index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(border: Border.all()),
                child: InstaImageViewer(
                  child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesItems}${controller.itemModel!.images![index]}"),
                ),
              ),
              MaterialCustomButton(
                onPressed: () => controller
                    .deleteItemImage(controller.itemModel!.images![index]),
                title: 'delete',
                color: Colors.red,
              )
            ],
          ),
        ),
      );
    });
  }
}
