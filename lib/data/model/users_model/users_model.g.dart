// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersModelImpl _$$UsersModelImplFromJson(Map<String, dynamic> json) =>
    _$UsersModelImpl(
      usersId: json['users_id'] as int?,
      usersName: json['users_name'] as String?,
      usersEmail: json['users_email'] as String?,
      usersPassword: json['users_password'] as String?,
      usersPhone: json['users_phone'] as String?,
      usersImage: json['users_image'] as String?,
      usersVerifycode: json['users_verifycode'] as int?,
      usersApprove: json['users_approve'] as int?,
      usersCreate: json['users_create'] == null
          ? null
          : DateTime.parse(json['users_create'] as String),
      userFavBranchId: json['user_fav_branch_id'] as int?,
      usersIsAnonymous: json['users_is_Anonymous'] as int?,
      ordersCount: json['ordersCount'] as int?,
      totalsPrice: json['totalsPrice'] as num?,
      pickupOrdersPrice: json['pickupOrdersPrice'] as num?,
      pickupOrdersCount: json['pickupOrdersCount'] as int?,
      deliveryOrdersPrice: json['deliveryOrdersPrice'] as num?,
      deliveryOrdersCount: json['deliveryOrdersCount'] as int?,
    );

Map<String, dynamic> _$$UsersModelImplToJson(_$UsersModelImpl instance) =>
    <String, dynamic>{
      'users_id': instance.usersId,
      'users_name': instance.usersName,
      'users_email': instance.usersEmail,
      'users_password': instance.usersPassword,
      'users_phone': instance.usersPhone,
      'users_image': instance.usersImage,
      'users_verifycode': instance.usersVerifycode,
      'users_approve': instance.usersApprove,
      'users_create': instance.usersCreate?.toIso8601String(),
      'user_fav_branch_id': instance.userFavBranchId,
      'users_is_Anonymous': instance.usersIsAnonymous,
      'ordersCount': instance.ordersCount,
      'totalsPrice': instance.totalsPrice,
      'pickupOrdersPrice': instance.pickupOrdersPrice,
      'pickupOrdersCount': instance.pickupOrdersCount,
      'deliveryOrdersPrice': instance.deliveryOrdersPrice,
      'deliveryOrdersCount': instance.deliveryOrdersCount,
    };
