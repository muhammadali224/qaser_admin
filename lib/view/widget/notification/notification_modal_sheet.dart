import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notification_controller/view_notification_controller.dart';
import '../../../core/extension/space_extension.dart';
import '../../../core/function/valid_input.dart';
import '../shred_component/input_form_field.dart';
import '../shred_component/material_button.dart';

class NotificationModalSheet extends GetView<NotificationViewController> {
  const NotificationModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
                child: Text("إرسال إشعار",
                    style: TextStyle(fontSize: 22, color: Colors.black))),
            InputFormField(
              hintTitle: 'عنوان الاشعار',
              labelString: 'أدخل عنوان الاشعار',
              controller: controller.title,
              icon: Icons.title,
              validate: (val) {
                return validInput(val!, 2, 50, 'name');
              },
            ),
            InputFormField(
              hintTitle: 'نص الاشعار',
              labelString: 'أدخل نص الاشعار',
              controller: controller.body,
              icon: Icons.text_fields,
              isExpanded: true,
              validate: (val) {
                return validInput(val!, 3, 50, 'name');
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("إرسال إلى :"),
            ),
            GetBuilder<NotificationViewController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    items: [
                      ...List.generate(
                          controller.topicOption.length,
                          (index) => DropdownMenuItem(
                                value: controller.topicOption[index]['value'],
                                child: Text(
                                  controller.topicOption[index]['name']!,
                                ),
                              )),
                    ],
                    value: controller.selectedTopic,
                    onChanged: controller.onChanged,
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 1.2)),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      iconSize: 20,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              );
            }),
            MaterialCustomButton(
              onPressed: controller.addNotification,
              title: 'إرسال',
              color: Colors.indigoAccent,
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}
