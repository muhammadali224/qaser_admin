import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/api_link.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/model/items_model/items_model.dart';
import 'view_items_controller.dart';

class AddEditItemsController extends GetxController {
  bool isEdit = false;

  ItemsModel? itemsModel;
  late CategoriesModel catModel;

  StatusRequest statusRequest = StatusRequest.none;
  ViewItemController itemsViewController = Get.put(ViewItemController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  late TextEditingController descEn;
  late TextEditingController descAr;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController point;

  File? file;
  String imageUrl = "";

  void setIsEdit(bool value) {
    isEdit = value;
  }

  editItem() async {
    //   if (formKey.currentState!.validate()) {
    //     try {
    //       SmartDialog.showLoading(msg: 'loading'.tr);
    //       var catModel = CategoriesModel(
    //         categoriesNameAr: nameAr.text,
    //         categoriesName: nameEn.text,
    //       );
    //
    //       var response = file == null
    //           ? await itemsViewController.itemsData.editCategory(
    //               categoryModel: catModel,
    //               id: categoryModel!.categoriesId.toString(),
    //             )
    //           : await categoriesViewController.categoriesData
    //               .editCategoryWithImage(
    //                   categoryModel: catModel,
    //                   id: categoryModel!.categoriesId.toString(),
    //                   file: file!,
    //                   oldFile: categoryModel!.categoriesImage!);
    //       statusRequest = handlingData(response);
    //       if (statusRequest == StatusRequest.success) {
    //         if (response["status"] == "success") {
    //           SmartDialog.dismiss();
    //           SmartDialog.showNotify(
    //               msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
    //           Get.offAndToNamed(AppRoutes.viewCategories);
    //           itemsViewController.getItems();
    //         }
    //       } else {
    //         statusRequest = StatusRequest.failed;
    //       }
    //     } catch (e) {
    //       SmartDialog.showToast(e.toString());
    //     }
    //   }
    //   update();
  }

  addItemWithImage() async {
    if (file != null && formKey.currentState!.validate()) {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var itemModel = ItemsModel(
        itemsName: nameEn.text,
        itemsNameAr: nameAr.text,
        itemsDesc: descEn.text,
        itemsDescAr: descAr.text,
        itemsPrice: num.parse(price.text),
        itemsCount: int.parse(count.text),
        itemsActive: 1,
        itemsDiscount: num.parse(discount.text),
        itemsCat: catModel.categoriesId,
      );
      var response = await itemsViewController.itemsData.addItemWithImage(
        itemModel,
        file!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
          Get.offAndToNamed(AppRoutes.viewItems,
              arguments: {'model': catModel});
          itemsViewController.getItems();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } else {
      SmartDialog.showToast(
          "الرجاء التأكد من اختيار الصورة وتعبئة كافة المعلومات");
    }
    update();
  }

  editAvailableInBranch(int branchId, bool val) async {
    //   try {
    //     SmartDialog.showLoading(msg: 'loading'.tr);
    //     var response = val == true
    //         ? await categoriesViewController.categoriesData
    //             .addToBranch(branchId, categoryModel!.categoriesId!)
    //         : await categoriesViewController.categoriesData
    //             .removeFromBranch(branchId, categoryModel!.categoriesId!);
    //     statusRequest = handlingData(response);
    //     if (statusRequest == StatusRequest.success) {
    //       if (response["status"] == "success") {
    //         SmartDialog.dismiss();
    //         SmartDialog.showNotify(
    //             msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
    //         var responseList = response["data"][0];
    //         categoryModel = CategoriesModel.fromJson(responseList);
    //       }
    //     } else {
    //       statusRequest = StatusRequest.failed;
    //     }
    //   } catch (e) {
    //     SmartDialog.dismiss();
    //     SmartDialog.showToast(e.toString());
    //   }
    //   update();
  }

  initData() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();
    descEn = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    point = TextEditingController();
  }

  initEditData(ItemsModel itemsModel) {
    nameAr = TextEditingController(text: itemsModel.itemsNameAr);
    nameEn = TextEditingController(text: itemsModel.itemsName);
    descEn = TextEditingController(text: itemsModel.itemsDesc);
    descAr = TextEditingController(text: itemsModel.itemsDescAr);
    count = TextEditingController(text: itemsModel.itemsCount.toString());
    price = TextEditingController(text: itemsModel.itemsPrice.toString());
    discount = TextEditingController(text: itemsModel.itemsDiscount.toString());
    point = TextEditingController(text: itemsModel.itemsPointPerVal.toString());
    imageUrl = "${AppLink.imagesItems}${itemsModel.itemsImage}";
  }

  @override
  void onInit() {
    catModel = Get.arguments['catModel'];
    if (Get.currentRoute == "/editItems") {
      itemsModel = Get.arguments['model'];
      setIsEdit(true);
      initEditData(itemsModel!);
    } else if (Get.currentRoute == "/addItems") {
      initData();
    }
    super.onInit();
  }

  @override
  void dispose() {
    nameAr.dispose();
    nameEn.dispose();

    super.dispose();
  }
}