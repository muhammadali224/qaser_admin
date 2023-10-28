import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/weight_size_model/weight_size_model.dart';

class SubItemsData {
  CRUD crud;

  SubItemsData(this.crud);

  getSubItems() async {
    var response = await crud.postData(AppLink.viewWeightSize, {});
    return response.fold((l) => l, (r) => r);
  }

  addSubItem(WeightSizeModel weightModel) async {
    var response = await crud.postData(AppLink.addWeightSize, {
      "subItemNameEn": weightModel.subItemName,
      "subItemNameAr": weightModel.subItemNameAr,
      "subItemValue": weightModel.subItemValue.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editSubItem(WeightSizeModel weightModel, String id) async {
    var response = await crud.postData(AppLink.editWeightSize, {
      "subItemId": id,
      "subItemNameEn": weightModel.subItemName,
      "subItemNameAr": weightModel.subItemNameAr,
      "subItemValue": weightModel.subItemValue.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteSubItems(String subItemsId) async {
    var response = await crud.postData(AppLink.deleteWeightSize, {
      'weightId': subItemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
