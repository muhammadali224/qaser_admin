// To parse this JSON data, do
//
//     final subItemsModel = subItemsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_items_model.freezed.dart';
part 'sub_items_model.g.dart';

SubItemsModel subItemsModelFromJson(String str) =>
    SubItemsModel.fromJson(json.decode(str));

String subItemsModelToJson(SubItemsModel data) => json.encode(data.toJson());

@freezed
class SubItemsModel with _$SubItemsModel {
  const factory SubItemsModel({
    @JsonKey(name: "sub_item_id") int? subItemId,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sub_id") int? subId,
    @JsonKey(name: "sub_items_price") num? subItemsPrice,
    @JsonKey(name: "weight_size_id") int? weightSizeId,
    @JsonKey(name: "sub_item_name") String? subItemName,
    @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
    @JsonKey(name: "sub_item_value") num? subItemValue,
  }) = _SubItemsModel;

  factory SubItemsModel.fromJson(Map<String, dynamic> json) =>
      _$SubItemsModelFromJson(json);
}
