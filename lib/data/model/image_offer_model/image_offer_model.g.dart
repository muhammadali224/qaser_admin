// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageOfferModelImpl _$$ImageOfferModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageOfferModelImpl(
      id: json['id'] as int?,
      offerImageUrl: json['offer_image_url'] as String?,
      isActive: json['isActive'] as int?,
      viewLevel: json['view_level'] as int?,
    );

Map<String, dynamic> _$$ImageOfferModelImplToJson(
        _$ImageOfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'offer_image_url': instance.offerImageUrl,
      'isActive': instance.isActive,
      'view_level': instance.viewLevel,
    };
