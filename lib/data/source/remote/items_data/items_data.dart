import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
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

  editItemWithImage(
      {required ItemsModel itemModel,
      required String id,
      required File file,
      required String oldFile}) async {
    var response = await crud.addRequestWithImage(
      AppLink.editWithImageItem,
      {
        "itemId": id,
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
        "itemsGroup": itemModel.itemsGroup.toString(),
        "oldFile": oldFile,
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  editItem({required ItemsModel itemModel, required String id}) async {
    var response = await crud.postData(
      AppLink.editItem,
      {
        "itemId": id,
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
        "itemsGroup": itemModel.itemsGroup.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteItem(String itemId, String imageName) async {
    var response = await crud.postData(AppLink.deleteItem, {
      'itermId': itemId,
      "image": imageName,
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
        "itemAttr": itemModel.itemsAttrId.toString(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  addToBranch(int branchId, int itemId) async {
    var response = await crud.postData(AppLink.addItemToBranch, {
      'branchId': branchId.toString(),
      'itemId': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromBranch(int branchId, int itemId) async {
    var response = await crud.postData(AppLink.removeItemFromBranch, {
      'branchId': branchId.toString(),
      'itemId': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemWeight(int weightId, int itemId, String price) async {
    var response = await crud.postData(AppLink.addItemWeight, {
      'weightId': weightId.toString(),
      'itemId': itemId.toString(),
      'price': price,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeItemWeight(int weightId, int itemId) async {
    var response = await crud.postData(AppLink.removeItemWeight, {
      'weightId': weightId.toString(),
      'itemId': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemImage(int itemId, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItemImage,
      {
        "itemId": itemId.toString(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  removeItemImage(int itemId, String imageName) async {
    var response = await crud.postData(
      AppLink.deleteItemImage,
      {
        "itemId": itemId.toString(),
        "imageName": imageName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getSubItems(int itemsId) async {
    var response = await crud.postData(AppLink.viewSubItems, {
      "itemId": itemsId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
