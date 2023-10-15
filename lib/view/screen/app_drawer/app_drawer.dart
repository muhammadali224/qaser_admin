import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../generated/assets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      builder: (controller) {
        return Drawer(
          elevation: 10,
          child: ListView(
            shrinkWrap: true,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(controller.userName),
                accountEmail: Text(controller.email),
                currentAccountPictureSize: const Size.square(75.0),
                currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage(Assets.imagesQaser)),
              ),
              ListTile(
                title: Text(
                  controller.isOpen == true
                      ? "branchIsOpen".tr
                      : "branchIsClose".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                trailing: controller.statusRequest == StatusRequest.success ||
                        controller.statusRequest == StatusRequest.close
                    ? Switch(
                        value: controller.isOpen!,
                        onChanged: controller.onChanged,
                      )
                    : controller.statusRequest == StatusRequest.loading
                        ? const CircularProgressIndicator()
                        : IconButton(
                            onPressed: controller.getBranch,
                            icon: const Icon(Icons.refresh)),
                // trailing: CircularProgressIndicator(),
              ),
              ListTile(
                onTap: () => controller.goToPrinters(),
                trailing: const Icon(Icons.print_outlined),
                title: Text(
                  "printers".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () => controller.scanBarcodeNormal(),
                trailing: const Icon(Icons.qr_code_scanner_rounded),
                title: Text(
                  "qrCodeScan".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              ListTile(
                trailing: const Icon(IconBroken.Logout),
                title: Text(
                  "logout".tr,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
