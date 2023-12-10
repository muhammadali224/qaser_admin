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
    @JsonKey(name: "sub_item_id") required int subItemId,
    @JsonKey(name: "item_id") required int itemId,
    @JsonKey(name: "sub_id") required int subId,
    @JsonKey(name: "sub_items_price") required int subItemsPrice,
    @JsonKey(name: "weight_size_id") required int weightSizeId,
    @JsonKey(name: "sub_item_name") required String subItemName,
    @JsonKey(name: "sub_item_name_ar") required String subItemNameAr,
    @JsonKey(name: "sub_item_value") required int subItemValue,
  }) = _SubItemsModel;

  factory SubItemsModel.fromJson(Map<String, dynamic> json) =>
      _$SubItemsModelFromJson(json);
}
