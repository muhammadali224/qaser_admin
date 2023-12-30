import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/items_point_model/items_point_model.dart';

class ItemsPointData {
  CRUD crud;

  ItemsPointData(this.crud);

  getItemsPoint(String catId) async {
    var response = await crud.postData(AppLink.viewItemsPoint, {});
    return response.fold((l) => l, (r) => r);
  }

  updateActiveItemsPoint({required String state, required String id}) async {
    var response = await crud.postData(
      AppLink.updateActiveItemsPoint,
      {
        "id": id,
        "state": state,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteItemsPoint(String itemsPointId, String imageName) async {
    var response = await crud.postData(AppLink.deleteItemsPoint, {
      "id": itemsPointId,
      "image": imageName,
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemsPointWithImage(ItemsPointModel itemsPointModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItemsPoint,
      {
        "name": itemsPointModel.itemsPointName,
        "nameAr": itemsPointModel.itemsPointNameAr,
        "startDate": itemsPointModel.itemsPointStartDate.toString(),
        "expireDate": itemsPointModel.itemsPointExpireDate.toString(),
        "count": itemsPointModel.itemsPointCount.toString(),
        "price": itemsPointModel.itemsPointPrice.toString(),
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
}
