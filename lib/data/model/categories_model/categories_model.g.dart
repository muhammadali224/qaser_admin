// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriesModelImpl _$$CategoriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoriesModelImpl(
      categoriesId: json['categories_id'] as int?,
      categoriesName: json['categories_name'] as String?,
      categoriesNameAr: json['categories_name_ar'] as String?,
      categoriesImage: json['categories_image'] as String?,
      categoriesIsActive: json['categories_isActive'] as int?,
      categoriesDatetime: json['categories_datetime'] == null
          ? null
          : DateTime.parse(json['categories_datetime'] as String),
      branchId: json['branch_id'] as int?,
    );

Map<String, dynamic> _$$CategoriesModelImplToJson(
        _$CategoriesModelImpl instance) =>
    <String, dynamic>{
      'categories_id': instance.categoriesId,
      'categories_name': instance.categoriesName,
      'categories_name_ar': instance.categoriesNameAr,
      'categories_image': instance.categoriesImage,
      'categories_isActive': instance.categoriesIsActive,
      'categories_datetime': instance.categoriesDatetime?.toIso8601String(),
      'branch_id': instance.branchId,
    };
