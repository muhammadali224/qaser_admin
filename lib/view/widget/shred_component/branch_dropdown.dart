import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../data/source/shared/branch_list.dart';

class BranchDropdown extends StatelessWidget {
  final String value;
  final void Function(String?)? onChanged;

  const BranchDropdown({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: branchList.isEmpty
          ? Container(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.branches);
                },
                child: const Text("لا يوجد فروع اضغط هنا للاضافة"),
              ),
            )
          : DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                items: [
                  ...List.generate(
                      branchList.length,
                      (index) => DropdownMenuItem(
                            value: branchList[index].branchId.toString(),
                            child: Text(
                              branchList[index].branchNameAr!,
                            ),
                          )),
                ],
                value: value,
                onChanged: onChanged,
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
  }
}
