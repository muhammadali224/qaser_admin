import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/color.dart';
import '../../../controller/categories_controller/add_edit_categories_controller.dart';
import '../../../core/function/pick_image.dart';
import '../../../generated/assets.dart';
import '../shred_component/circular_cached_network_image.dart';

class CategoryImageHeader extends GetView<AddEditCategoryController> {
  const CategoryImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditCategoryController>(builder: (controller) {
      return Center(
        child: Stack(
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 10))
                  ],
                ),
                child: controller.isEdit && controller.file == null
                    ? CircularNetworkImages(imageUrl: controller.imageUrl)
                    : controller.file != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(controller.file!),
                            radius: 35,
                          )
                        : const CircleAvatar(
                            backgroundImage: AssetImage(Assets.imagesQaser),
                            radius: 35,
                          )),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  controller.file = await pickImage(ImageSource.gallery);
                  controller.update();
                },
                child: Container(
                  height: 40,
                  width: 40,
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
            )
          ],
        ),
      );
    });
  }
}
