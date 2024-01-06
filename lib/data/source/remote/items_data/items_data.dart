import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/items_model/items_model.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getItems(String catId) async {
    var response = await crud.postData(AppLink.viewItem, {
      'catId': catId.trim(),
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
        "itemId": id.trim(),
        "itemNameEn": itemModel.itemsName!.trim(),
        "itemNameAr": itemModel.itemsNameAr!.trim(),
        "itemDescEn": itemModel.itemsDesc!.trim(),
        "itemDescAr": itemModel.itemsDescAr!.trim(),
        "itemCount": itemModel.itemsCount.toString().trim(),
        "itemActive": itemModel.itemsActive.toString().trim(),
        "itemPrice": itemModel.itemsPrice.toString().trim(),
        "itemDiscount": itemModel.itemsDiscount.toString().trim(),
        "itemPoint": itemModel.itemsPointPerVal.toString().trim(),
        "itemCat": itemModel.itemsCat.toString().trim(),
        "itemGroup": itemModel.itemsGroup.toString().trim(),
        "oldFile": oldFile.trim(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  editItem({required ItemsModel itemModel, required String id}) async {
    var response = await crud.postData(
      AppLink.editItem,
      {
        "itemId": id.trim(),
        "itemNameEn": itemModel.itemsName!.trim(),
        "itemNameAr": itemModel.itemsNameAr!.trim(),
        "itemDescEn": itemModel.itemsDesc!.trim(),
        "itemDescAr": itemModel.itemsDescAr!.trim(),
        "itemCount": itemModel.itemsCount.toString().trim(),
        "itemActive": itemModel.itemsActive.toString().trim(),
        "itemPrice": itemModel.itemsPrice.toString().trim(),
        "itemDiscount": itemModel.itemsDiscount.toString().trim(),
        "itemPoint": itemModel.itemsPointPerVal.toString().trim(),
        "itemCat": itemModel.itemsCat.toString().trim(),
        "itemGroup": itemModel.itemsGroup.toString().trim(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteItem(String itemId, String imageName) async {
    var response = await crud.postData(AppLink.deleteItem, {
      "itemId": itemId.trim(),
      "image": imageName.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemWithImage(ItemsModel itemModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItem,
      {
        "itemNameEn": itemModel.itemsName!.trim(),
        "itemNameAr": itemModel.itemsNameAr!.trim(),
        "itemDescEn": itemModel.itemsDesc!.trim(),
        "itemDescAr": itemModel.itemsDescAr!.trim(),
        "itemCount": itemModel.itemsCount.toString().trim(),
        "itemActive": itemModel.itemsActive.toString().trim(),
        "itemPrice": itemModel.itemsPrice.toString().trim(),
        "itemDiscount": itemModel.itemsDiscount.toString().trim(),
        "itemPoint": itemModel.itemsPointPerVal.toString().trim(),
        "itemCat": itemModel.itemsCat.toString().trim(),
        "itemGroup": itemModel.itemsGroup.toString().trim(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  addToBranch(int branchId, int itemId) async {
    var response = await crud.postData(AppLink.addItemToBranch, {
      'branchId': branchId.toString().trim(),
      'itemId': itemId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromBranch(int branchId, int itemId) async {
    var response = await crud.postData(AppLink.removeItemFromBranch, {
      'branchId': branchId.toString().trim(),
      'itemId': itemId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addSubItem(String name, String nameAr, int itemId, String price,
      String discount) async {
    var response = await crud.postData(AppLink.addItemWeight, {
      'subName': name.trim(),
      'subNameAr': nameAr.trim(),
      'itemId': itemId.toString().trim(),
      'price': price.trim(),
      'discount': discount.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editItemWeight(int id, int weightId, int itemId, String price) async {
    var response = await crud.postData(AppLink.editItemWeight, {
      'id': id.toString().trim(),
      'weightId': weightId.toString().trim(),
      'itemId': itemId.toString().trim(),
      'price': price.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeItemWeight(int id) async {
    var response = await crud.postData(AppLink.removeItemWeight, {
      'id': id.toString().trim(),
    });

    return response.fold((l) => l, (r) => r);
  }

  addItemImage(int itemId, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItemImage,
      {
        "itemId": itemId.toString().trim(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  removeItemImage(int itemId, String imageName) async {
    var response = await crud.postData(
      AppLink.deleteItemImage,
      {
        "itemId": itemId.toString().trim(),
        "imageName": imageName.trim(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getSubItems(int itemsId) async {
    var response = await crud.postData(AppLink.viewSubItems, {
      "itemId": itemsId.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
