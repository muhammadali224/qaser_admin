import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/categories_model/categories_model.dart';

class CategoriesData {
  CRUD crud;

  CategoriesData(this.crud);

  getCategories() async {
    var response = await crud.postData(AppLink.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }

  editCategoryWithImage(
      {required CategoriesModel categoryModel,
      required String id,
      required File file,
      required String oldFile}) async {
    var response = await crud.addRequestWithImage(
      AppLink.editWithImageCategories,
      {
        "catId": id.trim(),
        "catNameEn": categoryModel.categoriesName!.trim(),
        "catNameAr": categoryModel.categoriesNameAr!.trim(),
        "oldFile": oldFile.trim(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  editCategory(
      {required CategoriesModel categoryModel, required String id}) async {
    var response = await crud.postData(
      AppLink.editCategories,
      {
        "catId": id.trim(),
        "catNameEn": categoryModel.categoriesName!.trim(),
        "catNameAr": categoryModel.categoriesNameAr!.trim(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteCategory(String categoryId) async {
    var response = await crud.postData(AppLink.deleteCategories, {
      'categoryId': categoryId.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addImage(CategoriesModel categoryModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addCategories,
      {
        "catNameEn": categoryModel.categoriesName!.trim(),
        "catNameAr": categoryModel.categoriesNameAr!.trim(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  addToBranch(int branchId, int categoryId) async {
    var response = await crud.postData(AppLink.addCategoriesToBranch, {
      'branchId': branchId.toString().trim(),
      'categoryId': categoryId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromBranch(int branchId, int categoryId) async {
    var response = await crud.postData(AppLink.removeCategoriesFromBranch, {
      'branchId': branchId.toString().trim(),
      'categoryId': categoryId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
