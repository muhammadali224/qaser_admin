// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightSizeModelImpl _$$WeightSizeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightSizeModelImpl(
      weightSizeId: json['weight_size_id'] as int?,
      subItemName: json['sub_item_name'] as String?,
      subItemNameAr: json['sub_item_name_ar'] as String?,
      subItemValue: json['sub_item_value'] as num?,
    );

Map<String, dynamic> _$$WeightSizeModelImplToJson(
        _$WeightSizeModelImpl instance) =>
    <String, dynamic>{
      'weight_size_id': instance.weightSizeId,
      'sub_item_name': instance.subItemName,
      'sub_item_name_ar': instance.subItemNameAr,
      'sub_item_value': instance.subItemValue,
    };
