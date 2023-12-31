import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/api_link.dart';
import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import 'view_categories_controller.dart';

class AddEditCategoryController extends GetxController {
  bool isEdit = false;

  CategoriesModel? categoryModel;
  StatusRequest statusRequest = StatusRequest.none;
  ViewCategoriesController categoriesViewController =
      Get.put(ViewCategoriesController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  File? file;
  String imageUrl = "";

  void setIsEdit(bool value) {
    isEdit = value;
  }

  editCategory() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var catModel = CategoriesModel(
          categoriesNameAr: nameAr.text,
          categoriesName: nameEn.text,
        );

        var response = file == null
            ? await categoriesViewController.categoriesData.editCategory(
                categoryModel: catModel,
                id: categoryModel!.categoriesId.toString(),
              )
            : await categoriesViewController.categoriesData
                .editCategoryWithImage(
                    categoryModel: catModel,
                    id: categoryModel!.categoriesId.toString(),
                    file: file!,
                    oldFile: categoryModel!.categoriesImage!);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.viewCategories);
            categoriesViewController.getCategories();
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
        throw Exception(e.toString());
      }
    }
    update();
  }

  uploadImage() async {
    try {
      if (file != null && formKey.currentState!.validate()) {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var catModel = CategoriesModel(
            categoriesNameAr: nameAr.text, categoriesName: nameEn.text);
        var response = await categoriesViewController.categoriesData.addImage(
          catModel,
          file!,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.viewCategories);
            categoriesViewController.getCategories();
          } else {
            statusRequest = StatusRequest.failed;
          }
        }
      } else {
        SmartDialog.showToast(
            "الرجاء التأكد من اختيار الصورة وتعبئة كافة المعلومات");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  editAvailableInBranch(int branchId, bool val) async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = val == true
          ? await categoriesViewController.categoriesData
              .addToBranch(branchId, categoryModel!.categoriesId!)
          : await categoriesViewController.categoriesData
              .removeFromBranch(branchId, categoryModel!.categoriesId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
          var responseList = response["data"][0];
          categoryModel = CategoriesModel.fromJson(responseList);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialog.showToast(e.toString());
      throw Exception(e.toString());
    }
    update();
  }

  initData() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();
  }

  initEditData(CategoriesModel cateModel) {
    nameAr = TextEditingController(text: cateModel.categoriesNameAr);
    nameEn = TextEditingController(text: cateModel.categoriesName);
    imageUrl = "${AppLink.imagesCategories}${cateModel.categoriesImage}";
  }

  @override
  void onInit() {
    try {
      if (Get.currentRoute == "/editCategory") {
        categoryModel = Get.arguments['model'];
        setIsEdit(true);
        initEditData(categoryModel!);
      } else if (Get.currentRoute == "/addCategory") {
        initData();
      }
    } catch (e) {
      throw Exception(e.toString());
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
