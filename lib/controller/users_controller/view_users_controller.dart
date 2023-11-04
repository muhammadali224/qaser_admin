import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/search_enum.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/pop_menu_model/pop_menu_model.dart';
import '../../data/model/users_model/users_model.dart';
import '../../data/source/remote/users_data/users_data.dart';

class UsersViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<UsersModel> usersList = [];
  List<UsersModel> outputUserList = [];
  List<UsersModel> listSearchResult = [];
  SearchState searchState = SearchState.none;
  late TextEditingController searchText;
  final UsersData usersData = UsersData(Get.find());
  List<PopMenuModel> optionMenu = [
    PopMenuModel(name: "الكل", value: "1", icon: Icons.reorder),
    PopMenuModel(name: "الغير مفعلين", value: "2", icon: Icons.no_accounts),
    PopMenuModel(name: "حسب الاسم", value: "3", icon: Icons.abc_outlined),
    PopMenuModel(name: "حسب التاريخ", value: "4", icon: Icons.date_range),
    PopMenuModel(
        name: "الاكثر عدد طلبات",
        value: "5",
        icon: Icons.shopping_cart_checkout),
    PopMenuModel(name: "الاقل عدد طلبات", value: "6", icon: Icons.no_food),
    PopMenuModel(name: "الاكثر سعر طلبات", value: "7", icon: Icons.money),
    PopMenuModel(
        name: "الاقل سعر طلبات", value: "8", icon: Icons.money_off_rounded),
    PopMenuModel(name: "المستخدمين المحظورين", value: "9", icon: Icons.block),
  ];

  selectOptionList(String val) {
    switch (val) {
      case "1":
        outputUserList.assignAll(usersList);
        break;
      case "2":
        outputUserList =
            usersList.where((element) => element.usersApprove == 0).toList();
        break;
      case "3":
        outputUserList.sort((a, b) => a.usersName!.compareTo(b.usersName!));
        break;
      case "4":
        outputUserList.sort((a, b) => a.usersCreate!.compareTo(b.usersCreate!));
        break;
      case "5":
        outputUserList.sort((a, b) => a.ordersCount!.compareTo(b.ordersCount!));
        break;
      case "6":
        outputUserList.sort((a, b) => b.ordersCount!.compareTo(a.ordersCount!));
        break;
      case "7":
        outputUserList.sort((a, b) => a.totalsPrice!.compareTo(b.totalsPrice!));
        break;
      case "8":
        outputUserList.sort((a, b) => b.totalsPrice!.compareTo(a.totalsPrice!));
        break;
      case "9":
        outputUserList =
            usersList.where((element) => element.usersApprove == 2).toList();
        break;
    }

    update();
  }

  getUsers() async {
    try {
      usersList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await usersData.getUsers();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          usersList.addAll(responseList.map((e) => UsersModel.fromJson(e)));
          outputUserList.assignAll(usersList);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteUser(int id, String imageName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.deleteUser(id.toString(), imageName);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getUsers();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  searchUser(String val) {
    if (searchText.text.isEmpty) {
      searchState = SearchState.none;
      listSearchResult.clear();
      update();
    } else {
      searchState = SearchState.loading;
      listSearchResult.clear();
      update();
      listSearchResult = usersList
          .where((element) =>
              element.usersName!.contains(val.trim()) ||
              element.usersPhone!.contains(val.trim()) ||
              element.usersEmail!.contains(val.trim()))
          .toList();
      searchState =
          listSearchResult.isEmpty ? SearchState.noResult : SearchState.loaded;

      print(listSearchResult);
      update();
    }
    update();
  }

  goToUserDetails(UsersModel userMod) {
    Get.toNamed(AppRoutes.userDetails, arguments: {
      "model": userMod,
    });
  }

  @override
  void onInit() async {
    searchText = TextEditingController();
    await getUsers();
    super.onInit();
  }
}
