// To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_model.freezed.dart';
part 'items_model.g.dart';

ItemsModel itemsModelFromJson(String str) =>
    ItemsModel.fromJson(json.decode(str));

String itemsModelToJson(ItemsModel data) => json.encode(data.toJson());

@freezed
class ItemsModel with _$ItemsModel {
  const factory ItemsModel({
    @JsonKey(name: "items_id") int? itemsId,
    @JsonKey(name: "items_name") String? itemsName,
    @JsonKey(name: "items_name_ar") String? itemsNameAr,
    @JsonKey(name: "items_desc") String? itemsDesc,
    @JsonKey(name: "items_desc_ar") String? itemsDescAr,
    @JsonKey(name: "items_image") String? itemsImage,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_active") int? itemsActive,
    @JsonKey(name: "items_price") num? itemsPrice,
    @JsonKey(name: "items_discount") num? itemsDiscount,
    @JsonKey(name: "items_data") DateTime? itemsData,
    @JsonKey(name: "items_cat") int? itemsCat,
    @JsonKey(name: "branch_id") int? branchId,
  }) = _ItemsModel;

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);
}
