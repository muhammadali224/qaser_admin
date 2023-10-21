// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchModelImpl _$$BranchModelImplFromJson(Map<String, dynamic> json) =>
    _$BranchModelImpl(
      json['id'] as int?,
      json['branchNameAr'] as String?,
      json['branchNameEn'] as String?,
      json['isOpen'] as int?,
      (json['branchLat'] as num?)?.toDouble(),
      (json['branchLong'] as num?)?.toDouble(),
      json['phoneNumber1'] as String?,
      json['phoneNumber2'] as String?,
      json['facebookUrl'] as String?,
      (json['deliveryCharge'] as num?)?.toDouble(),
      json['isFixed'] as int?,
      (json['branchZone'] as num?)?.toDouble(),
      (json['deliveryFixCharge'] as num?)?.toDouble(),
      (json['branchMaxZone'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BranchModelImplToJson(_$BranchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchNameAr': instance.branchNameAr,
      'branchNameEn': instance.branchNameEn,
      'isOpen': instance.isOpen,
      'branchLat': instance.branchLat,
      'branchLong': instance.branchLong,
      'phoneNumber1': instance.phoneNumber1,
      'phoneNumber2': instance.phoneNumber2,
      'facebookUrl': instance.facebookUrl,
      'deliveryCharge': instance.deliveryCharge,
      'isFixed': instance.isFixed,
      'branchZone': instance.branchZone,
      'deliveryFixCharge': instance.deliveryFixCharge,
      'branchMaxZone': instance.branchMaxZone,
    };
