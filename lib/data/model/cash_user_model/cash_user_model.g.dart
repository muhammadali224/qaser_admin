// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashUserModelImpl _$$CashUserModelImplFromJson(Map<String, dynamic> json) =>
    _$CashUserModelImpl(
      cashSystemId: json['cash_system_id'] as int?,
      cashUserName: json['cash_user_name'] as String?,
      cashUserEmail: json['cash_user_email'] as String?,
      cashUserPassword: json['cash_user_password'] as String?,
      cashBranchId: json['cash_branch_id'] as int?,
      cashUserCreateDate: json['cash_user_create_date'] == null
          ? null
          : DateTime.parse(json['cash_user_create_date'] as String),
    );

Map<String, dynamic> _$$CashUserModelImplToJson(_$CashUserModelImpl instance) =>
    <String, dynamic>{
      'cash_system_id': instance.cashSystemId,
      'cash_user_name': instance.cashUserName,
      'cash_user_email': instance.cashUserEmail,
      'cash_user_password': instance.cashUserPassword,
      'cash_branch_id': instance.cashBranchId,
      'cash_user_create_date': instance.cashUserCreateDate?.toIso8601String(),
    };
