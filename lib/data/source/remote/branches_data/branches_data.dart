import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/branch_model/branch_model.dart';

class BranchesData {
  CRUD crud;

  BranchesData(this.crud);

  getBranches(String userLevel, String branchId) async {
    var response = await crud.postData(AppLink.getBranch, {
      'branchId': branchId,
      'userLevel': userLevel,
    });
    return response.fold((l) => l, (r) => r);
  }

  addBranches(BranchModel branchModel) async {
    var response = await crud.postData(AppLink.addBranch, {
      "branchNameAr": branchModel.branchNameAr,
      "branchNameEn": branchModel.branchNameEn,
      "branchIsOpen": branchModel.branchIsOpen.toString(),
      "branchLang": branchModel.branchLang.toString(),
      "branchLat": branchModel.branchLat.toString(),
      "branchPhone1": branchModel.branchPhone1,
      "branchPhone2": branchModel.branchPhone2,
      "branchFacebookUrl": branchModel.branchFacebookUrl,
      "branchDeliveryCharge": branchModel.branchDeliveryCharge.toString(),
      "branchIsFixed": branchModel.branchIsFixed.toString(),
      "branchZone": branchModel.branchZone.toString(),
      "branchDeliveryFixCharge": branchModel.branchDeliveryFixCharge.toString(),
      "branchMaxZone": branchModel.branchMaxZone.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editBranches(BranchModel branchModel, String id) async {
    var response = await crud.postData(AppLink.editBranch, {
      "branchId": id,
      "branchNameAr": branchModel.branchNameAr,
      "branchNameEn": branchModel.branchNameEn,
      "branchIsOpen": branchModel.branchIsOpen.toString(),
      "branchLang": branchModel.branchLang.toString(),
      "branchLat": branchModel.branchLat.toString(),
      "branchPhone1": branchModel.branchPhone1,
      "branchPhone2": branchModel.branchPhone2,
      "branchFacebookUrl": branchModel.branchFacebookUrl,
      "branchDeliveryCharge": branchModel.branchDeliveryCharge.toString(),
      "branchIsFixed": branchModel.branchIsFixed.toString(),
      "branchZone": branchModel.branchZone.toString(),
      "branchDeliveryFixCharge": branchModel.branchDeliveryFixCharge.toString(),
      "branchMaxZone": branchModel.branchMaxZone.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteBranches(String branchId) async {
    var response = await crud.postData(AppLink.deleteBranch, {
      'branchId': branchId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
