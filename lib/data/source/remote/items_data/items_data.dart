import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/categories_model/categories_model.dart';
import '../../../model/items_model/items_model.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getItems(String catId) async {
    var response = await crud.postData(AppLink.viewItem, {
      'catId': catId,
    });
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
      AppLink.editItem,
      {
        "catId": id,
        "catNameEn": categoryModel.categoriesName,
        "catNameAr": categoryModel.categoriesNameAr,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteCategory(String categoryId) async {
    var response = await crud.postData(AppLink.deleteItem, {
      'categoryId': categoryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemWithImage(ItemsModel itemModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItem,
      {
        "itemNameEn": itemModel.itemsName,
        "itemNameAr": itemModel.itemsNameAr,
        "itemDescEn": itemModel.itemsDesc,
        "itemDescAr": itemModel.itemsDescAr,
        "itemCount": itemModel.itemsCount.toString(),
        "itemActive": itemModel.itemsActive.toString(),
        "itemPrice": itemModel.itemsPrice.toString(),
        "itemDiscount": itemModel.itemsDiscount.toString(),
        "itemPoint": itemModel.itemsPointPerVal.toString(),
        "itemCat": itemModel.itemsCat.toString(),
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
