import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class CategoriesData {
  CRUD crud;

  CategoriesData(this.crud);

  getCategories(String userLevel, String branchId) async {
    var response = await crud.postData(AppLink.viewCategories, {
      'branchId': branchId,
      'userLevel': userLevel,
    });
    return response.fold((l) => l, (r) => r);
  }

  // addCategories(CategoriesModel categoriesModel) async {
//   var response = await crud.postData(AppLink.addCategories, {
//     "catNameEn": branchModel.branchNameAr,
//     "catNameAr": branchModel.branchNameEn,
//     "branchIsOpen": branchModel.branchIsOpen.toString(),
//     "branchLang": branchModel.branchLang.toString(),
//     "branchLat": branchModel.branchLat.toString(),
//     "branchPhone1": branchModel.branchPhone1,
//     "branchPhone2": branchModel.branchPhone2,
//     "branchFacebookUrl": branchModel.branchFacebookUrl,
//     "branchDeliveryCharge": branchModel.branchDeliveryCharge.toString(),
//     "branchIsFixed": branchModel.branchIsFixed.toString(),
//     "branchZone": branchModel.branchZone.toString(),
//     "branchDeliveryFixCharge": branchModel.branchDeliveryFixCharge.toString(),
//     "branchMaxZone": branchModel.branchMaxZone.toString(),
//   });
//   return response.fold((l) => l, (r) => r);
// }
//
// editBranches(BranchModel branchModel, String id) async {
//   var response = await crud.postData(AppLink.editBranch, {
//     "branchId": id,
//     "branchNameAr": branchModel.branchNameAr,
//     "branchNameEn": branchModel.branchNameEn,
//     "branchIsOpen": branchModel.branchIsOpen.toString(),
//     "branchLang": branchModel.branchLang.toString(),
//     "branchLat": branchModel.branchLat.toString(),
//     "branchPhone1": branchModel.branchPhone1,
//     "branchPhone2": branchModel.branchPhone2,
//     "branchFacebookUrl": branchModel.branchFacebookUrl,
//     "branchDeliveryCharge": branchModel.branchDeliveryCharge.toString(),
//     "branchIsFixed": branchModel.branchIsFixed.toString(),
//     "branchZone": branchModel.branchZone.toString(),
//     "branchDeliveryFixCharge": branchModel.branchDeliveryFixCharge.toString(),
//     "branchMaxZone": branchModel.branchMaxZone.toString(),
//   });
//   return response.fold((l) => l, (r) => r);
// }
//
// deleteBranches(String branchId) async {
//   var response = await crud.postData(AppLink.deleteBranch, {
//     'branchId': branchId,
//   });
//   return response.fold((l) => l, (r) => r);
// }
}
