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
    @JsonKey(name: "sub_items_name") String? subItemsName,
    @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
    @JsonKey(name: "sub_items_price") num? subItemsPrice,
  }) = _SubItemsModel;

  factory SubItemsModel.fromJson(Map<String, dynamic> json) =>
      _$SubItemsModelFromJson(json);
}
