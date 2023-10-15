import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/printers_controller/printers_controller.dart';

class Printers extends StatelessWidget {
  const Printers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrintersController(), permanent: true);
    return Scaffold(
        appBar: AppBar(
          title: Text("printers".tr),
        ),
        body: GetBuilder<PrintersController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                height: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controller.selectedPrinter == null ||
                                        controller.isConnected
                                    ? null
                                    : () {
                                        controller.connectDevice();
                                      },
                                child: const Text("إتصال",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controller.selectedPrinter == null ||
                                        !controller.isConnected
                                    ? null
                                    : () {
                                        if (controller.selectedPrinter !=
                                            null) {
                                          controller.printerManager
                                              .disconnect();

                                          controller.isConnected = false;
                                          controller.update();
                                        }
                                      },
                                child: const Text("قطع الاتصال ",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: Platform.isAndroid,
                        child: SwitchListTile.adaptive(
                          contentPadding:
                              const EdgeInsets.only(bottom: 20.0, left: 20),
                          title: const Text(
                            "هذا الجهاز يدعم الطاقة المنخفظة(low energy)",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 19.0),
                          ),
                          value: controller.isBle,
                          onChanged: (bool? value) {
                            controller.isBle = value ?? false;
                            controller.isConnected = false;
                            controller.selectedPrinter = null;
                            controller.scan();
                            controller.update();
                          },
                        ),
                      ),
                      Visibility(
                        visible: Platform.isAndroid,
                        child: SwitchListTile.adaptive(
                          contentPadding:
                              const EdgeInsets.only(bottom: 20.0, left: 20),
                          title: const Text(
                            "إعادة الاتصال",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 19.0),
                          ),
                          value: controller.reconnect,
                          onChanged: (bool? value) {
                            controller.reconnect = value ?? false;
                            controller.update();
                          },
                        ),
                      ),
                      Column(
                          children: controller.devices
                              .map(
                                (device) => ListTile(
                                  title: Text('${device.deviceName}'),
                                  subtitle: Text('${device.state}'),
                                  onTap: () {
                                    // do something
                                    controller.selectDevice(device);
                                  },
                                  leading: controller.selectedPrinter != null &&
                                          ((device.address != null &&
                                              controller.selectedPrinter!
                                                      .address ==
                                                  device.address))
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : null,
                                  trailing: OutlinedButton(
                                    onPressed:
                                        controller.selectedPrinter == null ||
                                                device.deviceName !=
                                                    controller.selectedPrinter
                                                        ?.deviceName
                                            ? null
                                            : () async {
                                                controller.printReceiveTest();
                                              },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 20),
                                      child: Text("Print test",
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class BluetoothPrinter {
  int? id;
  String? deviceName;
  String? address;
  bool? isBle;

  bool? state;

  BluetoothPrinter(
      {this.deviceName, this.address, this.state, this.isBle = false});
}
