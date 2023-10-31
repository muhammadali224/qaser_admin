import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/items_controller/add_edit_items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/pick_image.dart';
import '../../../generated/assets.dart';

class ItemImageHeader extends GetView<AddEditItemsController> {
  const ItemImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditItemsController>(builder: (controller) {
      return Container(
          height: Get.height / 3,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: controller.file == null && controller.isEdit == false
                    ? Image.asset(
                        Assets.imagesQaser,
                      )
                    : controller.file != null
                        ? Image.file(controller.file!)
                        : CachedNetworkImage(imageUrl: controller.imageUrl),
              ),
              GestureDetector(
                onTap: () async {
                  controller.file = await pickImage(ImageSource.gallery);
                  controller.update();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    shape: BoxShape.circle,
                    color: AppColor.fourthColor,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
          // Stack(
          //   children: [
          //     Container(
          //         height: 150,
          //         width: 150,
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //               width: 4,
          //               color: Theme.of(context).scaffoldBackgroundColor),
          //           shape: BoxShape.circle,
          //           boxShadow: [
          //             BoxShadow(
          //                 spreadRadius: 2,
          //                 blurRadius: 10,
          //                 color: Colors.black.withOpacity(0.3),
          //                 offset: const Offset(0, 10))
          //           ],
          //         ),
          //         child: controller.isEdit && controller.file == null
          //             ? CircularNetworkImages(imageUrl: controller.imageUrl)
          //             : controller.file != null
          //                 ? CircleAvatar(
          //                     backgroundImage: FileImage(controller.file!),
          //                     radius: 35,
          //                   )
          //                 : const CircleAvatar(
          //                     backgroundImage: AssetImage(Assets.imagesQaser),
          //                     radius: 35,
          //                   )),
          //     Positioned(
          //       bottom: 0,
          //       right: 0,
          //       child: GestureDetector(
          //         onTap: () async {
          //           controller.file = await pickImage(ImageSource.gallery);
          //           controller.update();
          //         },
          //         child: Container(
          //           height: 40,
          //           width: 40,
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 width: 4,
          //                 color: Theme.of(context).scaffoldBackgroundColor),
          //             shape: BoxShape.circle,
          //             color: AppColor.fourthColor,
          //           ),
          //           child: const Icon(
          //             Icons.edit,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          );
    });
  }
}
