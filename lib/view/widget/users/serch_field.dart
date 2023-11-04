import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/users_controller/view_users_controller.dart';

class SearchUserField extends GetView<UsersViewController> {
  const SearchUserField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: controller.searchUser,
        controller: controller.searchText,
        decoration: InputDecoration(
          hintText: "ابحث بواسطة الاسم, الهاتف, البريد الالكتروني",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(70),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
          suffixIcon: const Icon(Bootstrap.search, color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(70),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
        ),
      ),
    );
  }
}
