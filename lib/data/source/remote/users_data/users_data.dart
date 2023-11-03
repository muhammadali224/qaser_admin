import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class UsersData {
  CRUD crud;

  UsersData(this.crud);

  getUsers() async {
    var response = await crud.postData(AppLink.viewUsers, {});
    return response.fold((l) => l, (r) => r);
  }

  // addCoupon(CouponModel couponModel) async {
//   var response = await crud.postData(AppLink.addCoupon, {
//     "couponName": couponModel.couponName,
//     "couponCount": couponModel.couponCount.toString(),
//     "couponDiscount": couponModel.couponDiscount.toString(),
//     "couponBranchId": couponModel.branchId.toString(),
//     "couponStartDate": couponModel.couponStartDate.toString(),
//     "couponEndDate": couponModel.couponExpireDate.toString(),
//   });
//   return response.fold((l) => l, (r) => r);
// }
//
// editCoupon(CouponModel couponModel) async {
//   var response = await crud.postData(AppLink.editCoupon, {
//     "couponId": couponModel.couponId.toString(),
//     "couponName": couponModel.couponName,
//     "couponCount": couponModel.couponCount.toString(),
//     "couponDiscount": couponModel.couponDiscount.toString(),
//     "couponBranchId": couponModel.branchId.toString(),
//     "couponStartDate": couponModel.couponStartDate.toString(),
//     "couponEndDate": couponModel.couponExpireDate.toString(),
//   });
//   return response.fold((l) => l, (r) => r);
// }
//
  deleteUser(String userId, String userImage) async {
    var response = await crud.postData(AppLink.deleteUsers, {
      "userId": userId,
      "userImage": userImage,
    });
    return response.fold((l) => l, (r) => r);
  }
}
