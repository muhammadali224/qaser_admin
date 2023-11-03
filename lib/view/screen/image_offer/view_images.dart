import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../controller/image_offer_controller/view_offers_image_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/pick_image.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/material_button.dart';
import '../app_drawer/app_drawer.dart';

class ViewImageOffer extends StatelessWidget {
  const ViewImageOffer({super.key});

  @override
  Widget build(BuildContext context) {
    ViewOffersImageController controller = Get.put(ViewOffersImageController());
    return Scaffold(
      floatingActionButton: FAB(onTap: () async {
        controller.file = await pickImage(ImageSource.gallery);
        if (controller.file != null) {
          controller.addOfferWithImage();
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getImages(),
        child: Column(
          children: [
            const CurvedHeader(
                title: "offersImage", background: Colors.black54),
            Expanded(
              child:
                  GetBuilder<ViewOffersImageController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.imagesList.length,
                    itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            InstaImageViewer(
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imageOffer}${controller.imagesList[index].offerImageUrl!}"),
                            ),
                            MaterialCustomButton(
                              onPressed: () => controller
                                  .goToEditItem(controller.imagesList[index]),
                              title: 'edit',
                              color: Colors.green,
                            ),
                            MaterialCustomButton(
                              onPressed: () => controller.deleteItems(
                                  controller.imagesList[index].id!,
                                  controller.imagesList[index].offerImageUrl!),
                              title: 'delete',
                              color: Colors.red,
                            ),
                            const SizedBox(height: 30),
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                              thickness: 2,
                            ),
                          ],
                        )),
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
