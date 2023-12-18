// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmsModelImpl _$$SmsModelImplFromJson(Map<String, dynamic> json) =>
    _$SmsModelImpl(
      apiVersion: json['api_version'] as String?,
      id: json['id'] as int?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      region: json['region'] as String?,
      smsModelOperator: json['operator'] as String?,
      content: json['content'] as String?,
      dateCreated: json['date_created'] as String?,
      dateSent: json['date_sent'] as String?,
      status: json['status'] as String?,
      statusDescription: json['status_description'],
      timezone: json['timezone'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      priceUnit: json['price_unit'] as String?,
      flag: json['flag'],
    );

Map<String, dynamic> _$$SmsModelImplToJson(_$SmsModelImpl instance) =>
    <String, dynamic>{
      'api_version': instance.apiVersion,
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'region': instance.region,
      'operator': instance.smsModelOperator,
      'content': instance.content,
      'date_created': instance.dateCreated,
      'date_sent': instance.dateSent,
      'status': instance.status,
      'status_description': instance.statusDescription,
      'timezone': instance.timezone,
      'price': instance.price,
      'price_unit': instance.priceUnit,
      'flag': instance.flag,
    };
