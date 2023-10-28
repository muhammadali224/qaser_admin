// To parse this JSON data, do
//
//     final weightSizeModel = weightSizeModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_size_model.freezed.dart';
part 'weight_size_model.g.dart';

WeightSizeModel weightSizeModelFromJson(String str) =>
    WeightSizeModel.fromJson(json.decode(str));

String weightSizeModelToJson(WeightSizeModel data) =>
    json.encode(data.toJson());

@freezed
class WeightSizeModel with _$WeightSizeModel {
  const factory WeightSizeModel({
    @JsonKey(name: "weight_size_id") int? weightSizeId,
    @JsonKey(name: "sub_item_name") String? subItemName,
    @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
    @JsonKey(name: "sub_item_value") num? subItemValue,
  }) = _WeightSizeModel;

  factory WeightSizeModel.fromJson(Map<String, dynamic> json) =>
      _$WeightSizeModelFromJson(json);
}
