// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

@freezed
class CouponModel with _$CouponModel {
  const factory CouponModel({
    @JsonKey(name: "coupon_id") int? couponId,
    @JsonKey(name: "coupon_name") String? couponName,
    @JsonKey(name: "coupon_count") int? couponCount,
    @JsonKey(name: "coupon_startdate") String? couponStartDate,
    @JsonKey(name: "coupon_expiredate") String? couponExpireDate,
    @JsonKey(name: "coupon_discount") num? couponDiscount,
    @JsonKey(name: "branch_id") int? branchId,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
