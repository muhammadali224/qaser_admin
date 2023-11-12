// To parse this JSON data, do
//
//     final branchSummeryModel = branchSummeryModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_summery_model.freezed.dart';
part 'branch_summery_model.g.dart';

BranchSummeryModel branchSummeryModelFromJson(String str) =>
    BranchSummeryModel.fromJson(json.decode(str));

String branchSummeryModelToJson(BranchSummeryModel data) =>
    json.encode(data.toJson());

@freezed
class BranchSummeryModel with _$BranchSummeryModel {
  const factory BranchSummeryModel({
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "branch_name_ar") String? branchNameAr,
    @JsonKey(name: "order_year") int? orderYear,
    @JsonKey(name: "order_month") int? orderMonth,
    @JsonKey(name: "ordersCount") int? ordersCount,
    @JsonKey(name: "totalsPrice") int? totalsPrice,
    @JsonKey(name: "pickupOrdersPrice") int? pickupOrdersPrice,
    @JsonKey(name: "pickupOrdersCount") int? pickupOrdersCount,
    @JsonKey(name: "deliveryOrdersPrice") int? deliveryOrdersPrice,
    @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount,
  }) = _BranchSummeryModel;

  factory BranchSummeryModel.fromJson(Map<String, dynamic> json) =>
      _$BranchSummeryModelFromJson(json);
}
