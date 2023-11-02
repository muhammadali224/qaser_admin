// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponModelImpl _$$CouponModelImplFromJson(Map<String, dynamic> json) =>
    _$CouponModelImpl(
      couponId: json['coupon_id'] as int?,
      couponName: json['coupon_name'] as String?,
      couponCount: json['coupon_count'] as int?,
      couponStartDate: json['coupon_startdate'] as String?,
      couponExpireDate: json['coupon_expiredate'] as String?,
      couponDiscount: json['coupon_discount'] as num?,
      branchId: json['branch_id'] as int?,
    );

Map<String, dynamic> _$$CouponModelImplToJson(_$CouponModelImpl instance) =>
    <String, dynamic>{
      'coupon_id': instance.couponId,
      'coupon_name': instance.couponName,
      'coupon_count': instance.couponCount,
      'coupon_startdate': instance.couponStartDate,
      'coupon_expiredate': instance.couponExpireDate,
      'coupon_discount': instance.couponDiscount,
      'branch_id': instance.branchId,
    };
