import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/image_offer_controller/edit_offers_image_controller.dart';
import '../../widget/shred_component/material_button.dart';
import '../../widget/shred_component/padding_container.dart';

class EditImagesOffer extends StatelessWidget {
  const EditImagesOffer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditOffersImageController());
    return Scaffold(
      appBar: AppBar(title: Text('editOfferImage'.tr)),
      body: PaddingContainer(
        child: GetBuilder<EditOffersImageController>(builder: (controller) {
          return ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            children: [
              SwitchListTile(
                value: controller.getActiveBool(),
                title:
                    Text(controller.isActive == 1 ? "إيقاف التفعيل" : "تفعيل"),
                onChanged: controller.onChanged,
              ),
              const Text("عرض لـ :"),
              ...List.generate(
                controller.viewLevelMap.length,
                (index) => RadioListTile(
                    value: controller.viewLevelMap[index]["value"],
                    groupValue: controller.viewLevel,
                    title: Text(controller.viewLevelMap[index]["name"]),
                    onChanged: controller.onSelect),
              ),
              MaterialCustomButton(
                onPressed: () => controller.editImageData(),
                title: 'save',
                color: Colors.red,
              ),
            ],
          );
        }),
      ),
    );
  }
}
