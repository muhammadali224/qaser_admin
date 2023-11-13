// To parse this JSON data, do
//
//     final totalModel = totalModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_model.freezed.dart';
part 'total_model.g.dart';

TotalModel totalModelFromJson(String str) =>
    TotalModel.fromJson(json.decode(str));

String totalModelToJson(TotalModel data) => json.encode(data.toJson());

@freezed
class TotalModel with _$TotalModel {
  const factory TotalModel({
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "branch_name_ar") String? branchNameAr,
    @JsonKey(name: "order_year") int? orderYear,
    @JsonKey(name: "order_month") int? orderMonth,
    @JsonKey(name: "ordersCount") int? ordersCount,
    @JsonKey(name: "totalsPrice") num? totalsPrice,
    @JsonKey(name: "pickupOrdersPrice") num? pickupOrdersPrice,
    @JsonKey(name: "pickupOrdersCount") int? pickupOrdersCount,
    @JsonKey(name: "deliveryOrdersPrice") num? deliveryOrdersPrice,
    @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount,
  }) = _TotalModel;

  factory TotalModel.fromJson(Map<String, dynamic> json) =>
      _$TotalModelFromJson(json);
}
