import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notification_controller/view_notification_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/show_modal_sheet.dart';
import '../../widget/notification/notification_modal_sheet.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_list_tile.dart';
import '../app_drawer/app_drawer.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationViewController controller =
        Get.put(NotificationViewController());

    return Scaffold(
      floatingActionButton: FAB(
          onTap: () => showModalSheet(context, const NotificationModalSheet())),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: controller.getNotification,
        child: Column(
          children: [
            const CurvedHeader(
                title: 'notification', background: Colors.indigoAccent),
            Expanded(
              child:
                  GetBuilder<NotificationViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.notificationList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ItemListTile(
                        title: controller
                            .notificationList[index].notificationsTitle!,
                        subtitle:
                            "${controller.notificationList[index].notificationsBody}",
                        // onEditTap: () => controller
                        //     .goToEditCoupon(controller.couponList[index]),
                        onDeleteTap: () => controller.deleteNotification(
                            controller
                                .notificationList[index].notificationsId!),
                      ),
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
