// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

@freezed
class AdminModel with _$AdminModel {
  const factory AdminModel({
    @JsonKey(name: "admin_id") int? adminId,
    @JsonKey(name: "admin_name") String? adminName,
    @JsonKey(name: "admin_email") String? adminEmail,
    @JsonKey(name: "admin_password") String? adminPassword,
    @JsonKey(name: "admin_branch_id") int? adminBranchId,
    @JsonKey(name: "admin_super_admin") int? adminSuperAdmin,
  }) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
