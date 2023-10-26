// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.freezed.dart';
part 'categories_model.g.dart';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

@freezed
class CategoriesModel with _$CategoriesModel {
  const factory CategoriesModel({
    @JsonKey(name: "categories_id") int? categoriesId,
    @JsonKey(name: "categories_name") String? categoriesName,
    @JsonKey(name: "categories_name_ar") String? categoriesNameAr,
    @JsonKey(name: "categories_image") String? categoriesImage,
    @JsonKey(name: "categories_isActive") int? categoriesIsActive,
    @JsonKey(name: "categories_datetime") DateTime? categoriesDatetime,
    @JsonKey(name: "branch_id") int? branchId,
  }) = _CategoriesModel;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
