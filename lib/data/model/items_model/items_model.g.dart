// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemsModelImpl _$$ItemsModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemsModelImpl(
      itemsId: json['items_id'] as int?,
      itemsName: json['items_name'] as String?,
      itemsNameAr: json['items_name_ar'] as String?,
      itemsDesc: json['items_desc'] as String?,
      itemsDescAr: json['items_desc_ar'] as String?,
      itemsImage: json['items_image'] as String?,
      itemsCount: json['items_count'] as int?,
      itemsActive: json['items_active'] as int?,
      itemsPrice: json['items_price'] as num?,
      itemsDiscount: json['items_discount'] as num?,
      itemsData: json['items_data'] == null
          ? null
          : DateTime.parse(json['items_data'] as String),
      itemsCat: json['items_cat'] as int?,
      branchId: json['branch_id'] as int?,
    );

Map<String, dynamic> _$$ItemsModelImplToJson(_$ItemsModelImpl instance) =>
    <String, dynamic>{
      'items_id': instance.itemsId,
      'items_name': instance.itemsName,
      'items_name_ar': instance.itemsNameAr,
      'items_desc': instance.itemsDesc,
      'items_desc_ar': instance.itemsDescAr,
      'items_image': instance.itemsImage,
      'items_count': instance.itemsCount,
      'items_active': instance.itemsActive,
      'items_price': instance.itemsPrice,
      'items_discount': instance.itemsDiscount,
      'items_data': instance.itemsData?.toIso8601String(),
      'items_cat': instance.itemsCat,
      'branch_id': instance.branchId,
    };
