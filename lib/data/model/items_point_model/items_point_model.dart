// To parse this JSON data, do
//
//     final itemsPointModel = itemsPointModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_point_model.freezed.dart';
part 'items_point_model.g.dart';

ItemsPointModel itemsPointModelFromJson(String str) =>
    ItemsPointModel.fromJson(json.decode(str));

String itemsPointModelToJson(ItemsPointModel data) =>
    json.encode(data.toJson());

@freezed
class ItemsPointModel with _$ItemsPointModel {
  const factory ItemsPointModel({
    @JsonKey(name: "items_point_id") int? itemsPointId,
    @JsonKey(name: "items_point_name") String? itemsPointName,
    @JsonKey(name: "items_point_name_ar") String? itemsPointNameAr,
    @JsonKey(name: "items_point_start_date") DateTime? itemsPointStartDate,
    @JsonKey(name: "items_point_expire_date") DateTime? itemsPointExpireDate,
    @JsonKey(name: "items_point_count") int? itemsPointCount,
    @JsonKey(name: "items_point_user_replacment") int? itemsPointUserReplacment,
    @JsonKey(name: "items_point_price") num? itemsPointPrice,
    @JsonKey(name: "items_point_is_active") int? itemsPointIsActive,
    @JsonKey(name: "items_point_image") String? itemsPointImage,
  }) = _ItemsPointModel;

  factory ItemsPointModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsPointModelFromJson(json);
}
