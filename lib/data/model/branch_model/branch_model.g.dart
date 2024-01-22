// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchModelImpl _$$BranchModelImplFromJson(Map<String, dynamic> json) =>
    _$BranchModelImpl(
      branchId: json['branch_id'] as int?,
      branchNameAr: json['branch_name_ar'] as String?,
      branchNameEn: json['branch_name_en'] as String?,
      branchIsOpen: json['branch_is_open'] as int?,
      branchLang: (json['branch_lang'] as num?)?.toDouble(),
      branchLat: (json['branch_lat'] as num?)?.toDouble(),
      branchPhone1: json['branch_phone1'] as String?,
      branchPhone2: json['branch_phone2'] as String?,
      branchFacebookUrl: json['branch_facebook_url'] as String?,
      branchStartDelivery: json['branch_start_delivery'] as num?,
      branchDeliveryCharge: json['branch_delivery_charge'] as num?,
      branchIsFixed: json['branch_isFixed'] as num?,
      branchZone: json['branch_zone'] as num?,
      branchDeliveryFixCharge: json['branch_delivery_fix_charge'] as num?,
      branchMaxZone: json['branch_max_zone'] as num?,
    );

Map<String, dynamic> _$$BranchModelImplToJson(_$BranchModelImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'branch_name_ar': instance.branchNameAr,
      'branch_name_en': instance.branchNameEn,
      'branch_is_open': instance.branchIsOpen,
      'branch_lang': instance.branchLang,
      'branch_lat': instance.branchLat,
      'branch_phone1': instance.branchPhone1,
      'branch_phone2': instance.branchPhone2,
      'branch_facebook_url': instance.branchFacebookUrl,
      'branch_start_delivery': instance.branchStartDelivery,
      'branch_delivery_charge': instance.branchDeliveryCharge,
      'branch_isFixed': instance.branchIsFixed,
      'branch_zone': instance.branchZone,
      'branch_delivery_fix_charge': instance.branchDeliveryFixCharge,
      'branch_max_zone': instance.branchMaxZone,
    };
