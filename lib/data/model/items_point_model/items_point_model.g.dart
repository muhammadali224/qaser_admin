// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemsPointModelImpl _$$ItemsPointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemsPointModelImpl(
      itemsPointId: json['items_point_id'] as int?,
      itemsPointName: json['items_point_name'] as String?,
      itemsPointNameAr: json['items_point_name_ar'] as String?,
      itemsPointStartDate: json['items_point_start_date'] == null
          ? null
          : DateTime.parse(json['items_point_start_date'] as String),
      itemsPointExpireDate: json['items_point_expire_date'] == null
          ? null
          : DateTime.parse(json['items_point_expire_date'] as String),
      itemsPointCount: json['items_point_count'] as int?,
      itemsPointUserReplacment: json['items_point_user_replacment'] as int?,
      itemsPointPrice: json['items_point_price'] as num?,
      itemsPointIsActive: json['items_point_is_active'] as int?,
      itemsPointImage: json['items_point_image'] as String?,
    );

Map<String, dynamic> _$$ItemsPointModelImplToJson(
        _$ItemsPointModelImpl instance) =>
    <String, dynamic>{
      'items_point_id': instance.itemsPointId,
      'items_point_name': instance.itemsPointName,
      'items_point_name_ar': instance.itemsPointNameAr,
      'items_point_start_date': instance.itemsPointStartDate?.toIso8601String(),
      'items_point_expire_date':
          instance.itemsPointExpireDate?.toIso8601String(),
      'items_point_count': instance.itemsPointCount,
      'items_point_user_replacment': instance.itemsPointUserReplacment,
      'items_point_price': instance.itemsPointPrice,
      'items_point_is_active': instance.itemsPointIsActive,
      'items_point_image': instance.itemsPointImage,
    };
