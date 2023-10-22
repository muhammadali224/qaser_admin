// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return _AdminModel.fromJson(json);
}

/// @nodoc
mixin _$AdminModel {
  @JsonKey(name: "admin_id")
  int? get adminId => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_name")
  String? get adminName => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_email")
  String? get adminEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_password")
  String? get adminPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_branch_id")
  int? get adminBranchId => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_super_admin")
  int? get adminSuperAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminModelCopyWith<AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminModelCopyWith<$Res> {
  factory $AdminModelCopyWith(
          AdminModel value, $Res Function(AdminModel) then) =
      _$AdminModelCopyWithImpl<$Res, AdminModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "admin_id") int? adminId,
      @JsonKey(name: "admin_name") String? adminName,
      @JsonKey(name: "admin_email") String? adminEmail,
      @JsonKey(name: "admin_password") String? adminPassword,
      @JsonKey(name: "admin_branch_id") int? adminBranchId,
      @JsonKey(name: "admin_super_admin") int? adminSuperAdmin});
}

/// @nodoc
class _$AdminModelCopyWithImpl<$Res, $Val extends AdminModel>
    implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adminId = freezed,
    Object? adminName = freezed,
    Object? adminEmail = freezed,
    Object? adminPassword = freezed,
    Object? adminBranchId = freezed,
    Object? adminSuperAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      adminId: freezed == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      adminEmail: freezed == adminEmail
          ? _value.adminEmail
          : adminEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      adminPassword: freezed == adminPassword
          ? _value.adminPassword
          : adminPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      adminBranchId: freezed == adminBranchId
          ? _value.adminBranchId
          : adminBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminSuperAdmin: freezed == adminSuperAdmin
          ? _value.adminSuperAdmin
          : adminSuperAdmin // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminModelImplCopyWith<$Res>
    implements $AdminModelCopyWith<$Res> {
  factory _$$AdminModelImplCopyWith(
          _$AdminModelImpl value, $Res Function(_$AdminModelImpl) then) =
      __$$AdminModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "admin_id") int? adminId,
      @JsonKey(name: "admin_name") String? adminName,
      @JsonKey(name: "admin_email") String? adminEmail,
      @JsonKey(name: "admin_password") String? adminPassword,
      @JsonKey(name: "admin_branch_id") int? adminBranchId,
      @JsonKey(name: "admin_super_admin") int? adminSuperAdmin});
}

/// @nodoc
class __$$AdminModelImplCopyWithImpl<$Res>
    extends _$AdminModelCopyWithImpl<$Res, _$AdminModelImpl>
    implements _$$AdminModelImplCopyWith<$Res> {
  __$$AdminModelImplCopyWithImpl(
      _$AdminModelImpl _value, $Res Function(_$AdminModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adminId = freezed,
    Object? adminName = freezed,
    Object? adminEmail = freezed,
    Object? adminPassword = freezed,
    Object? adminBranchId = freezed,
    Object? adminSuperAdmin = freezed,
  }) {
    return _then(_$AdminModelImpl(
      adminId: freezed == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      adminEmail: freezed == adminEmail
          ? _value.adminEmail
          : adminEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      adminPassword: freezed == adminPassword
          ? _value.adminPassword
          : adminPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      adminBranchId: freezed == adminBranchId
          ? _value.adminBranchId
          : adminBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      adminSuperAdmin: freezed == adminSuperAdmin
          ? _value.adminSuperAdmin
          : adminSuperAdmin // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminModelImpl implements _AdminModel {
  const _$AdminModelImpl(
      {@JsonKey(name: "admin_id") this.adminId,
      @JsonKey(name: "admin_name") this.adminName,
      @JsonKey(name: "admin_email") this.adminEmail,
      @JsonKey(name: "admin_password") this.adminPassword,
      @JsonKey(name: "admin_branch_id") this.adminBranchId,
      @JsonKey(name: "admin_super_admin") this.adminSuperAdmin});

  factory _$AdminModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminModelImplFromJson(json);

  @override
  @JsonKey(name: "admin_id")
  final int? adminId;
  @override
  @JsonKey(name: "admin_name")
  final String? adminName;
  @override
  @JsonKey(name: "admin_email")
  final String? adminEmail;
  @override
  @JsonKey(name: "admin_password")
  final String? adminPassword;
  @override
  @JsonKey(name: "admin_branch_id")
  final int? adminBranchId;
  @override
  @JsonKey(name: "admin_super_admin")
  final int? adminSuperAdmin;

  @override
  String toString() {
    return 'AdminModel(adminId: $adminId, adminName: $adminName, adminEmail: $adminEmail, adminPassword: $adminPassword, adminBranchId: $adminBranchId, adminSuperAdmin: $adminSuperAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminModelImpl &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.adminEmail, adminEmail) ||
                other.adminEmail == adminEmail) &&
            (identical(other.adminPassword, adminPassword) ||
                other.adminPassword == adminPassword) &&
            (identical(other.adminBranchId, adminBranchId) ||
                other.adminBranchId == adminBranchId) &&
            (identical(other.adminSuperAdmin, adminSuperAdmin) ||
                other.adminSuperAdmin == adminSuperAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, adminId, adminName, adminEmail,
      adminPassword, adminBranchId, adminSuperAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminModelImplCopyWith<_$AdminModelImpl> get copyWith =>
      __$$AdminModelImplCopyWithImpl<_$AdminModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminModelImplToJson(
      this,
    );
  }
}

abstract class _AdminModel implements AdminModel {
  const factory _AdminModel(
          {@JsonKey(name: "admin_id") final int? adminId,
          @JsonKey(name: "admin_name") final String? adminName,
          @JsonKey(name: "admin_email") final String? adminEmail,
          @JsonKey(name: "admin_password") final String? adminPassword,
          @JsonKey(name: "admin_branch_id") final int? adminBranchId,
          @JsonKey(name: "admin_super_admin") final int? adminSuperAdmin}) =
      _$AdminModelImpl;

  factory _AdminModel.fromJson(Map<String, dynamic> json) =
      _$AdminModelImpl.fromJson;

  @override
  @JsonKey(name: "admin_id")
  int? get adminId;
  @override
  @JsonKey(name: "admin_name")
  String? get adminName;
  @override
  @JsonKey(name: "admin_email")
  String? get adminEmail;
  @override
  @JsonKey(name: "admin_password")
  String? get adminPassword;
  @override
  @JsonKey(name: "admin_branch_id")
  int? get adminBranchId;
  @override
  @JsonKey(name: "admin_super_admin")
  int? get adminSuperAdmin;
  @override
  @JsonKey(ignore: true)
  _$$AdminModelImplCopyWith<_$AdminModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
