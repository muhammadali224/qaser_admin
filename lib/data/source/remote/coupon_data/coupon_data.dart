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
    var response = await crud.postData(AppLink.addCoupon, {});
    return response.fold((l) => l, (r) => r);
  }

  editCoupon(CouponModel couponModel, String id) async {
    var response = await crud.postData(AppLink.editCoupon, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteCoupon(String couponId) async {
    var response = await crud.postData(AppLink.deleteCoupon, {});
    return response.fold((l) => l, (r) => r);
  }
}
