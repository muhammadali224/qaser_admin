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
      "couponName": couponModel.couponName!.trim(),
      "couponCount": couponModel.couponCount.toString().trim(),
      "couponDiscount": couponModel.couponDiscount.toString().trim(),
      "couponBranchId": couponModel.branchId.toString().trim(),
      "couponStartDate": couponModel.couponStartDate.toString().trim(),
      "couponEndDate": couponModel.couponExpireDate.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editCoupon(CouponModel couponModel) async {
    var response = await crud.postData(AppLink.editCoupon, {
      "couponId": couponModel.couponId.toString().trim(),
      "couponName": couponModel.couponName!.trim(),
      "couponCount": couponModel.couponCount.toString().trim(),
      "couponDiscount": couponModel.couponDiscount.toString().trim(),
      "couponBranchId": couponModel.branchId.toString().trim(),
      "couponStartDate": couponModel.couponStartDate.toString().trim(),
      "couponEndDate": couponModel.couponExpireDate.toString().trim(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCoupon(String couponId) async {
    var response = await crud
        .postData(AppLink.deleteCoupon, {"couponId": couponId.trim()});
    return response.fold((l) => l, (r) => r);
  }
}
