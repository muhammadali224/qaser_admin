// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminModelImpl _$$AdminModelImplFromJson(Map<String, dynamic> json) =>
    _$AdminModelImpl(
      adminId: json['admin_id'] as int?,
      adminName: json['admin_name'] as String?,
      adminEmail: json['admin_email'] as String?,
      adminPassword: json['admin_password'] as String?,
      adminBranchId: json['admin_branch_id'] as int?,
      adminSuperAdmin: json['admin_super_admin'] as int?,
    );

Map<String, dynamic> _$$AdminModelImplToJson(_$AdminModelImpl instance) =>
    <String, dynamic>{
      'admin_id': instance.adminId,
      'admin_name': instance.adminName,
      'admin_email': instance.adminEmail,
      'admin_password': instance.adminPassword,
      'admin_branch_id': instance.adminBranchId,
      'admin_super_admin': instance.adminSuperAdmin,
    };
