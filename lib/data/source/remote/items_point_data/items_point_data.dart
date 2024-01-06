import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/items_point_model/items_point_model.dart';

class ItemsPointData {
  CRUD crud;

  ItemsPointData(this.crud);

  getItemsPoint() async {
    var response = await crud.postData(AppLink.viewItemsPoint, {});
    return response.fold((l) => l, (r) => r);
  }

  updateActiveItemsPoint({required String state, required String id}) async {
    var response = await crud.postData(
      AppLink.updateActiveItemsPoint,
      {
        "id": id.trim(),
        "state": state.trim(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteItemsPoint(String itemsPointId, String imageName) async {
    var response = await crud.postData(AppLink.deleteItemsPoint, {
      "id": itemsPointId.trim(),
      "image": imageName.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemsPointWithImage(ItemsPointModel itemsPointModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addItemsPoint,
      {
        "name": itemsPointModel.itemsPointName!.trim(),
        "nameAr": itemsPointModel.itemsPointNameAr!.trim(),
        "startDate": itemsPointModel.itemsPointStartDate.toString().trim(),
        "expireDate": itemsPointModel.itemsPointExpireDate.toString().trim(),
        "count": itemsPointModel.itemsPointCount.toString().trim(),
        "price": itemsPointModel.itemsPointPrice.toString().trim(),
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
}
