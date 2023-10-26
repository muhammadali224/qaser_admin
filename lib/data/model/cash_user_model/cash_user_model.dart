// To parse this JSON data, do
//
//     final cashUserModel = cashUserModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_user_model.freezed.dart';
part 'cash_user_model.g.dart';

CashUserModel cashUserModelFromJson(String str) =>
    CashUserModel.fromJson(json.decode(str));

String cashUserModelToJson(CashUserModel data) => json.encode(data.toJson());

@freezed
class CashUserModel with _$CashUserModel {
  const factory CashUserModel({
    @JsonKey(name: "cash_system_id") int? cashSystemId,
    @JsonKey(name: "cash_user_name") String? cashUserName,
    @JsonKey(name: "cash_user_email") String? cashUserEmail,
    @JsonKey(name: "cash_user_password") String? cashUserPassword,
    @JsonKey(name: "cash_branch_id") int? cashBranchId,
    @JsonKey(name: "cash_user_create_date") DateTime? cashUserCreateDate,
  }) = _CashUserModel;

  factory CashUserModel.fromJson(Map<String, dynamic> json) =>
      _$CashUserModelFromJson(json);
}
