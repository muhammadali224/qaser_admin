// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_model.freezed.dart';

part 'users_model.g.dart';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

@freezed
class UsersModel with _$UsersModel {
  const factory UsersModel({
    @JsonKey(name: "users_id") int? usersId,
    @JsonKey(name: "users_name") String? usersName,
    @JsonKey(name: "users_email") String? usersEmail,
    @JsonKey(name: "users_password") String? usersPassword,
    @JsonKey(name: "users_phone") String? usersPhone,
    @JsonKey(name: "users_image") String? usersImage,
    @JsonKey(name: "users_verifycode") int? usersVerifycode,
    @JsonKey(name: "users_approve") int? usersApprove,
    @JsonKey(name: "users_create") DateTime? usersCreate,
    @JsonKey(name: "user_fav_branch_id") int? userFavBranchId,
    @JsonKey(name: "users_is_Anonymous") int? usersIsAnonymous,
    @JsonKey(name: "ordersCount") int? ordersCount,
    @JsonKey(name: "totalsPrice") num? totalsPrice,
    @JsonKey(name: "pickupOrdersPrice") num? pickupOrdersPrice,
    @JsonKey(name: "pickupOrdersCount") int? pickupOrdersCount,
    @JsonKey(name: "deliveryOrdersPrice") num? deliveryOrdersPrice,
    @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
