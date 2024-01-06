import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/branch_model/branch_model.dart';

class BranchesData {
  CRUD crud;

  BranchesData(this.crud);

  getBranches(String userLevel, String branchId) async {
    var response = await crud.postData(AppLink.getBranch, {
      'branchId': branchId.trim(),
      'userLevel': userLevel.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addBranches(BranchModel branchModel) async {
    var response = await crud.postData(AppLink.addBranch, {
      "branchNameAr": branchModel.branchNameAr!.trim(),
      "branchNameEn": branchModel.branchNameEn!.trim(),
      "branchIsOpen": branchModel.branchIsOpen.toString().trim(),
      "branchLang": branchModel.branchLang.toString().trim(),
      "branchLat": branchModel.branchLat.toString().trim(),
      "branchPhone1": branchModel.branchPhone1!.trim(),
      "branchPhone2": branchModel.branchPhone2!.trim(),
      "branchFacebookUrl": branchModel.branchFacebookUrl!.trim(),
      "branchDeliveryCharge":
          branchModel.branchDeliveryCharge.toString().trim(),
      "branchIsFixed": branchModel.branchIsFixed.toString().trim(),
      "branchZone": branchModel.branchZone.toString().trim(),
      "branchDeliveryFixCharge":
          branchModel.branchDeliveryFixCharge.toString().trim(),
      "branchMaxZone": branchModel.branchMaxZone.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editBranches(BranchModel branchModel, String id) async {
    var response = await crud.postData(AppLink.editBranch, {
      "branchId": id.trim(),
      "branchNameAr": branchModel.branchNameAr!.trim(),
      "branchNameEn": branchModel.branchNameEn!.trim(),
      "branchIsOpen": branchModel.branchIsOpen.toString().trim(),
      "branchLang": branchModel.branchLang.toString().trim(),
      "branchLat": branchModel.branchLat.toString().trim(),
      "branchPhone1": branchModel.branchPhone1!.trim(),
      "branchPhone2": branchModel.branchPhone2!.trim(),
      "branchFacebookUrl": branchModel.branchFacebookUrl!.trim(),
      "branchDeliveryCharge":
          branchModel.branchDeliveryCharge.toString().trim(),
      "branchIsFixed": branchModel.branchIsFixed.toString().trim(),
      "branchZone": branchModel.branchZone.toString().trim(),
      "branchDeliveryFixCharge":
          branchModel.branchDeliveryFixCharge.toString().trim(),
      "branchMaxZone": branchModel.branchMaxZone.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteBranches(String branchId) async {
    var response = await crud.postData(AppLink.deleteBranch, {
      'branchId': branchId.trim(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
