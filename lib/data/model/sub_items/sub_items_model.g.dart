// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubItemsModelImpl _$$SubItemsModelImplFromJson(Map<String, dynamic> json) =>
    _$SubItemsModelImpl(
      subItemId: json['sub_item_id'] as int,
      itemId: json['item_id'] as int,
      subId: json['sub_id'] as int,
      subItemsPrice: json['sub_items_price'] as int,
      weightSizeId: json['weight_size_id'] as int,
      subItemName: json['sub_item_name'] as String,
      subItemNameAr: json['sub_item_name_ar'] as String,
      subItemValue: json['sub_item_value'] as int,
    );

Map<String, dynamic> _$$SubItemsModelImplToJson(_$SubItemsModelImpl instance) =>
    <String, dynamic>{
      'sub_item_id': instance.subItemId,
      'item_id': instance.itemId,
      'sub_id': instance.subId,
      'sub_items_price': instance.subItemsPrice,
      'weight_size_id': instance.weightSizeId,
      'sub_item_name': instance.subItemName,
      'sub_item_name_ar': instance.subItemNameAr,
      'sub_item_value': instance.subItemValue,
    };
