import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/coupon_model/coupon_model.dart';

class CouponData {
  CRUD crud;

  CouponData(this.crud);

  getCoupon() async {
    var response = await crud.postData(AppLink.viewCoupon, {});
    return response.fold((l) => l, (r) => r);
  }

  addCoupon(CouponModel couponModel) async {
    var response = await crud.postData(AppLink.addCoupon, {
      "couponName": couponModel.couponName,
      "couponCount": couponModel.couponCount.toString(),
      "couponDiscount": couponModel.couponDiscount.toString(),
      "couponBranchId": couponModel.branchId.toString(),
      "couponStartDate": couponModel.couponStartDate.toString(),
      "couponEndDate": couponModel.couponExpireDate.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editCoupon(CouponModel couponModel) async {
    var response = await crud.postData(AppLink.editCoupon, {
      "couponId": couponModel.couponId.toString(),
      "couponName": couponModel.couponName,
      "couponCount": couponModel.couponCount.toString(),
      "couponDiscount": couponModel.couponDiscount.toString(),
      "couponBranchId": couponModel.branchId.toString(),
      "couponStartDate": couponModel.couponStartDate.toString(),
      "couponEndDate": couponModel.couponExpireDate.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCoupon(String couponId) async {
    var response =
        await crud.postData(AppLink.deleteCoupon, {"couponId": couponId});
    return response.fold((l) => l, (r) => r);
  }
}
