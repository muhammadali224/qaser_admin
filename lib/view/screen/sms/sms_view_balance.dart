import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../controller/sms_controller/sms_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/extension/space_extension.dart';

class SMSBalance extends StatelessWidget {
  const SMSBalance({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SMSController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("رصيد الرسائل"),
      ),
      body: GetBuilder<SMSController>(builder: (controller) {
        return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "الرصيد :",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    Text(
                      "${controller.balance} \$",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "عدد الرسائل المتبقي :",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    Text(
                      "${num.parse(controller.balance) ~/ 0.0127}",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              20.height,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              ElevatedButton(
                onPressed: controller.getAllSMS,
                child: const Text("جلب الرسائل"),
              ),
              10.height,
              if (controller.smsList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.smsList.length,
                      itemBuilder: (_, index) => Card(
                            color: Colors.grey.shade200,
                            surfaceTintColor: Colors.blueGrey,
                            shadowColor: Colors.grey,
                            elevation: 10,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: ListTile(
                              onTap: () {
                                SmartDialog.show(
                                    builder: (_) => Card(
                                          color: Colors.grey.shade200,
                                          surfaceTintColor: Colors.blueGrey,
                                          shadowColor: Colors.grey,
                                          elevation: 20,
                                          child: Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "تم الارسال :",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      controller.smsList[index]
                                                          .dateSent!,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "الحالة :",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      controller.smsList[index]
                                                          .status!,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "المشغل :",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      controller.smsList[index]
                                                          .smsModelOperator!,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              title: Text(
                                controller.smsList[index].to!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text(controller.smsList[index].content!),
                            ),
                          )),
                )
            ],
          ),
        );
      }),
    );
  }
}
