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
        "catId": id,
        "catNameEn": categoryModel.categoriesName,
        "catNameAr": categoryModel.categoriesNameAr,
        "oldFile": oldFile,
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
        "catId": id,
        "catNameEn": categoryModel.categoriesName,
        "catNameAr": categoryModel.categoriesNameAr,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteCategory(String categoryId) async {
    var response = await crud.postData(AppLink.deleteCategories, {
      'categoryId': categoryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addImage(CategoriesModel categoryModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addCategories,
      {
        "catNameEn": categoryModel.categoriesName,
        "catNameAr": categoryModel.categoriesNameAr,
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  addToBranch(int branchId, int categoryId) async {
    var response = await crud.postData(AppLink.addCategoriesToBranch, {
      'branchId': branchId.toString(),
      'categoryId': categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromBranch(int branchId, int categoryId) async {
    var response = await crud.postData(AppLink.removeCategoriesFromBranch, {
      'branchId': branchId.toString(),
      'categoryId': categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
