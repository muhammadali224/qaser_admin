// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubItemsModelImpl _$$SubItemsModelImplFromJson(Map<String, dynamic> json) =>
    _$SubItemsModelImpl(
      subItemId: json['sub_item_id'] as int?,
      itemId: json['item_id'] as int?,
      subItemsName: json['sub_items_name'] as String?,
      subItemsNameAr: json['sub_items_name_ar'] as String?,
      subItemsPrice: json['sub_items_price'] as num?,
    );

Map<String, dynamic> _$$SubItemsModelImplToJson(_$SubItemsModelImpl instance) =>
    <String, dynamic>{
      'sub_item_id': instance.subItemId,
      'item_id': instance.itemId,
      'sub_items_name': instance.subItemsName,
      'sub_items_name_ar': instance.subItemsNameAr,
      'sub_items_price': instance.subItemsPrice,
    };
