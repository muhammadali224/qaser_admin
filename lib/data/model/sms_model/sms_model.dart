// To parse this JSON data, do
//
//     final smsModel = smsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_model.freezed.dart';
part 'sms_model.g.dart';

SmsModel smsModelFromJson(String str) => SmsModel.fromJson(json.decode(str));

String smsModelToJson(SmsModel data) => json.encode(data.toJson());

@freezed
class SmsModel with _$SmsModel {
  const factory SmsModel({
    @JsonKey(name: "api_version") String? apiVersion,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "from") String? from,
    @JsonKey(name: "to") String? to,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "operator") String? smsModelOperator,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_sent") String? dateSent,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "status_description") dynamic statusDescription,
    @JsonKey(name: "timezone") String? timezone,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "price_unit") String? priceUnit,
    @JsonKey(name: "flag") dynamic flag,
  }) = _SmsModel;

  factory SmsModel.fromJson(Map<String, dynamic> json) =>
      _$SmsModelFromJson(json);
}
