// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

BranchModel branchModelFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

@freezed
class BranchModel with _$BranchModel {
  const factory BranchModel({
    @JsonKey(name: "branch_id") int? branchId,
    @JsonKey(name: "branch_name_ar") String? branchNameAr,
    @JsonKey(name: "branch_name_en") String? branchNameEn,
    @JsonKey(name: "branch_is_open") int? branchIsOpen,
    @JsonKey(name: "branch_lang") double? branchLang,
    @JsonKey(name: "branch_lat") double? branchLat,
    @JsonKey(name: "branch_phone1") String? branchPhone1,
    @JsonKey(name: "branch_phone2") String? branchPhone2,
    @JsonKey(name: "branch_facebook_url") String? branchFacebookUrl,
    @JsonKey(name: "branch_start_delivery") num? branchStartDelivery,
    @JsonKey(name: "branch_delivery_charge") num? branchDeliveryCharge,
    @JsonKey(name: "branch_isFixed") num? branchIsFixed,
    @JsonKey(name: "branch_zone") num? branchZone,
    @JsonKey(name: "branch_delivery_fix_charge") num? branchDeliveryFixCharge,
    @JsonKey(name: "branch_max_zone") num? branchMaxZone,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
