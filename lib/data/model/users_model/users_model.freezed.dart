// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return _UsersModel.fromJson(json);
}

/// @nodoc
mixin _$UsersModel {
  @JsonKey(name: "users_id")
  int? get usersId => throw _privateConstructorUsedError;
  @JsonKey(name: "users_name")
  String? get usersName => throw _privateConstructorUsedError;
  @JsonKey(name: "users_email")
  String? get usersEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "users_password")
  String? get usersPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "users_phone")
  String? get usersPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "users_image")
  String? get usersImage => throw _privateConstructorUsedError;
  @JsonKey(name: "users_verifycode")
  int? get usersVerifycode => throw _privateConstructorUsedError;
  @JsonKey(name: "users_approve")
  int? get usersApprove => throw _privateConstructorUsedError;
  @JsonKey(name: "users_create")
  DateTime? get usersCreate => throw _privateConstructorUsedError;
  @JsonKey(name: "user_fav_branch_id")
  int? get userFavBranchId => throw _privateConstructorUsedError;
  @JsonKey(name: "users_is_Anonymous")
  int? get usersIsAnonymous => throw _privateConstructorUsedError;
  @JsonKey(name: "ordersCount")
  int? get ordersCount => throw _privateConstructorUsedError;
  @JsonKey(name: "totalsPrice")
  num? get totalsPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "pickupOrdersPrice")
  num? get pickupOrdersPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "pickupOrdersCount")
  int? get pickupOrdersCount => throw _privateConstructorUsedError;
  @JsonKey(name: "deliveryOrdersPrice")
  num? get deliveryOrdersPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "deliveryOrdersCount")
  int? get deliveryOrdersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersModelCopyWith<UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) then) =
      _$UsersModelCopyWithImpl<$Res, UsersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "users_id") int? usersId,
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
      @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res, $Val extends UsersModel>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersId = freezed,
    Object? usersName = freezed,
    Object? usersEmail = freezed,
    Object? usersPassword = freezed,
    Object? usersPhone = freezed,
    Object? usersImage = freezed,
    Object? usersVerifycode = freezed,
    Object? usersApprove = freezed,
    Object? usersCreate = freezed,
    Object? userFavBranchId = freezed,
    Object? usersIsAnonymous = freezed,
    Object? ordersCount = freezed,
    Object? totalsPrice = freezed,
    Object? pickupOrdersPrice = freezed,
    Object? pickupOrdersCount = freezed,
    Object? deliveryOrdersPrice = freezed,
    Object? deliveryOrdersCount = freezed,
  }) {
    return _then(_value.copyWith(
      usersId: freezed == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as int?,
      usersName: freezed == usersName
          ? _value.usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersEmail: freezed == usersEmail
          ? _value.usersEmail
          : usersEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPassword: freezed == usersPassword
          ? _value.usersPassword
          : usersPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPhone: freezed == usersPhone
          ? _value.usersPhone
          : usersPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      usersImage: freezed == usersImage
          ? _value.usersImage
          : usersImage // ignore: cast_nullable_to_non_nullable
              as String?,
      usersVerifycode: freezed == usersVerifycode
          ? _value.usersVerifycode
          : usersVerifycode // ignore: cast_nullable_to_non_nullable
              as int?,
      usersApprove: freezed == usersApprove
          ? _value.usersApprove
          : usersApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      usersCreate: freezed == usersCreate
          ? _value.usersCreate
          : usersCreate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userFavBranchId: freezed == userFavBranchId
          ? _value.userFavBranchId
          : userFavBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      usersIsAnonymous: freezed == usersIsAnonymous
          ? _value.usersIsAnonymous
          : usersIsAnonymous // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersCount: freezed == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalsPrice: freezed == totalsPrice
          ? _value.totalsPrice
          : totalsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      pickupOrdersPrice: freezed == pickupOrdersPrice
          ? _value.pickupOrdersPrice
          : pickupOrdersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      pickupOrdersCount: freezed == pickupOrdersCount
          ? _value.pickupOrdersCount
          : pickupOrdersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryOrdersPrice: freezed == deliveryOrdersPrice
          ? _value.deliveryOrdersPrice
          : deliveryOrdersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      deliveryOrdersCount: freezed == deliveryOrdersCount
          ? _value.deliveryOrdersCount
          : deliveryOrdersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersModelImplCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$$UsersModelImplCopyWith(
          _$UsersModelImpl value, $Res Function(_$UsersModelImpl) then) =
      __$$UsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "users_id") int? usersId,
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
      @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount});
}

/// @nodoc
class __$$UsersModelImplCopyWithImpl<$Res>
    extends _$UsersModelCopyWithImpl<$Res, _$UsersModelImpl>
    implements _$$UsersModelImplCopyWith<$Res> {
  __$$UsersModelImplCopyWithImpl(
      _$UsersModelImpl _value, $Res Function(_$UsersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersId = freezed,
    Object? usersName = freezed,
    Object? usersEmail = freezed,
    Object? usersPassword = freezed,
    Object? usersPhone = freezed,
    Object? usersImage = freezed,
    Object? usersVerifycode = freezed,
    Object? usersApprove = freezed,
    Object? usersCreate = freezed,
    Object? userFavBranchId = freezed,
    Object? usersIsAnonymous = freezed,
    Object? ordersCount = freezed,
    Object? totalsPrice = freezed,
    Object? pickupOrdersPrice = freezed,
    Object? pickupOrdersCount = freezed,
    Object? deliveryOrdersPrice = freezed,
    Object? deliveryOrdersCount = freezed,
  }) {
    return _then(_$UsersModelImpl(
      usersId: freezed == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as int?,
      usersName: freezed == usersName
          ? _value.usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as String?,
      usersEmail: freezed == usersEmail
          ? _value.usersEmail
          : usersEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPassword: freezed == usersPassword
          ? _value.usersPassword
          : usersPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      usersPhone: freezed == usersPhone
          ? _value.usersPhone
          : usersPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      usersImage: freezed == usersImage
          ? _value.usersImage
          : usersImage // ignore: cast_nullable_to_non_nullable
              as String?,
      usersVerifycode: freezed == usersVerifycode
          ? _value.usersVerifycode
          : usersVerifycode // ignore: cast_nullable_to_non_nullable
              as int?,
      usersApprove: freezed == usersApprove
          ? _value.usersApprove
          : usersApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      usersCreate: freezed == usersCreate
          ? _value.usersCreate
          : usersCreate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userFavBranchId: freezed == userFavBranchId
          ? _value.userFavBranchId
          : userFavBranchId // ignore: cast_nullable_to_non_nullable
              as int?,
      usersIsAnonymous: freezed == usersIsAnonymous
          ? _value.usersIsAnonymous
          : usersIsAnonymous // ignore: cast_nullable_to_non_nullable
              as int?,
      ordersCount: freezed == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalsPrice: freezed == totalsPrice
          ? _value.totalsPrice
          : totalsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      pickupOrdersPrice: freezed == pickupOrdersPrice
          ? _value.pickupOrdersPrice
          : pickupOrdersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      pickupOrdersCount: freezed == pickupOrdersCount
          ? _value.pickupOrdersCount
          : pickupOrdersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryOrdersPrice: freezed == deliveryOrdersPrice
          ? _value.deliveryOrdersPrice
          : deliveryOrdersPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      deliveryOrdersCount: freezed == deliveryOrdersCount
          ? _value.deliveryOrdersCount
          : deliveryOrdersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersModelImpl implements _UsersModel {
  const _$UsersModelImpl(
      {@JsonKey(name: "users_id") this.usersId,
      @JsonKey(name: "users_name") this.usersName,
      @JsonKey(name: "users_email") this.usersEmail,
      @JsonKey(name: "users_password") this.usersPassword,
      @JsonKey(name: "users_phone") this.usersPhone,
      @JsonKey(name: "users_image") this.usersImage,
      @JsonKey(name: "users_verifycode") this.usersVerifycode,
      @JsonKey(name: "users_approve") this.usersApprove,
      @JsonKey(name: "users_create") this.usersCreate,
      @JsonKey(name: "user_fav_branch_id") this.userFavBranchId,
      @JsonKey(name: "users_is_Anonymous") this.usersIsAnonymous,
      @JsonKey(name: "ordersCount") this.ordersCount,
      @JsonKey(name: "totalsPrice") this.totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") this.pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") this.pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") this.deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount") this.deliveryOrdersCount});

  factory _$UsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersModelImplFromJson(json);

  @override
  @JsonKey(name: "users_id")
  final int? usersId;
  @override
  @JsonKey(name: "users_name")
  final String? usersName;
  @override
  @JsonKey(name: "users_email")
  final String? usersEmail;
  @override
  @JsonKey(name: "users_password")
  final String? usersPassword;
  @override
  @JsonKey(name: "users_phone")
  final String? usersPhone;
  @override
  @JsonKey(name: "users_image")
  final String? usersImage;
  @override
  @JsonKey(name: "users_verifycode")
  final int? usersVerifycode;
  @override
  @JsonKey(name: "users_approve")
  final int? usersApprove;
  @override
  @JsonKey(name: "users_create")
  final DateTime? usersCreate;
  @override
  @JsonKey(name: "user_fav_branch_id")
  final int? userFavBranchId;
  @override
  @JsonKey(name: "users_is_Anonymous")
  final int? usersIsAnonymous;
  @override
  @JsonKey(name: "ordersCount")
  final int? ordersCount;
  @override
  @JsonKey(name: "totalsPrice")
  final num? totalsPrice;
  @override
  @JsonKey(name: "pickupOrdersPrice")
  final num? pickupOrdersPrice;
  @override
  @JsonKey(name: "pickupOrdersCount")
  final int? pickupOrdersCount;
  @override
  @JsonKey(name: "deliveryOrdersPrice")
  final num? deliveryOrdersPrice;
  @override
  @JsonKey(name: "deliveryOrdersCount")
  final int? deliveryOrdersCount;

  @override
  String toString() {
    return 'UsersModel(usersId: $usersId, usersName: $usersName, usersEmail: $usersEmail, usersPassword: $usersPassword, usersPhone: $usersPhone, usersImage: $usersImage, usersVerifycode: $usersVerifycode, usersApprove: $usersApprove, usersCreate: $usersCreate, userFavBranchId: $userFavBranchId, usersIsAnonymous: $usersIsAnonymous, ordersCount: $ordersCount, totalsPrice: $totalsPrice, pickupOrdersPrice: $pickupOrdersPrice, pickupOrdersCount: $pickupOrdersCount, deliveryOrdersPrice: $deliveryOrdersPrice, deliveryOrdersCount: $deliveryOrdersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersModelImpl &&
            (identical(other.usersId, usersId) || other.usersId == usersId) &&
            (identical(other.usersName, usersName) ||
                other.usersName == usersName) &&
            (identical(other.usersEmail, usersEmail) ||
                other.usersEmail == usersEmail) &&
            (identical(other.usersPassword, usersPassword) ||
                other.usersPassword == usersPassword) &&
            (identical(other.usersPhone, usersPhone) ||
                other.usersPhone == usersPhone) &&
            (identical(other.usersImage, usersImage) ||
                other.usersImage == usersImage) &&
            (identical(other.usersVerifycode, usersVerifycode) ||
                other.usersVerifycode == usersVerifycode) &&
            (identical(other.usersApprove, usersApprove) ||
                other.usersApprove == usersApprove) &&
            (identical(other.usersCreate, usersCreate) ||
                other.usersCreate == usersCreate) &&
            (identical(other.userFavBranchId, userFavBranchId) ||
                other.userFavBranchId == userFavBranchId) &&
            (identical(other.usersIsAnonymous, usersIsAnonymous) ||
                other.usersIsAnonymous == usersIsAnonymous) &&
            (identical(other.ordersCount, ordersCount) ||
                other.ordersCount == ordersCount) &&
            (identical(other.totalsPrice, totalsPrice) ||
                other.totalsPrice == totalsPrice) &&
            (identical(other.pickupOrdersPrice, pickupOrdersPrice) ||
                other.pickupOrdersPrice == pickupOrdersPrice) &&
            (identical(other.pickupOrdersCount, pickupOrdersCount) ||
                other.pickupOrdersCount == pickupOrdersCount) &&
            (identical(other.deliveryOrdersPrice, deliveryOrdersPrice) ||
                other.deliveryOrdersPrice == deliveryOrdersPrice) &&
            (identical(other.deliveryOrdersCount, deliveryOrdersCount) ||
                other.deliveryOrdersCount == deliveryOrdersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      usersId,
      usersName,
      usersEmail,
      usersPassword,
      usersPhone,
      usersImage,
      usersVerifycode,
      usersApprove,
      usersCreate,
      userFavBranchId,
      usersIsAnonymous,
      ordersCount,
      totalsPrice,
      pickupOrdersPrice,
      pickupOrdersCount,
      deliveryOrdersPrice,
      deliveryOrdersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      __$$UsersModelImplCopyWithImpl<_$UsersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersModelImplToJson(
      this,
    );
  }
}

abstract class _UsersModel implements UsersModel {
  const factory _UsersModel(
      {@JsonKey(name: "users_id") final int? usersId,
      @JsonKey(name: "users_name") final String? usersName,
      @JsonKey(name: "users_email") final String? usersEmail,
      @JsonKey(name: "users_password") final String? usersPassword,
      @JsonKey(name: "users_phone") final String? usersPhone,
      @JsonKey(name: "users_image") final String? usersImage,
      @JsonKey(name: "users_verifycode") final int? usersVerifycode,
      @JsonKey(name: "users_approve") final int? usersApprove,
      @JsonKey(name: "users_create") final DateTime? usersCreate,
      @JsonKey(name: "user_fav_branch_id") final int? userFavBranchId,
      @JsonKey(name: "users_is_Anonymous") final int? usersIsAnonymous,
      @JsonKey(name: "ordersCount") final int? ordersCount,
      @JsonKey(name: "totalsPrice") final num? totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") final num? pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") final int? pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") final num? deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount")
      final int? deliveryOrdersCount}) = _$UsersModelImpl;

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$UsersModelImpl.fromJson;

  @override
  @JsonKey(name: "users_id")
  int? get usersId;
  @override
  @JsonKey(name: "users_name")
  String? get usersName;
  @override
  @JsonKey(name: "users_email")
  String? get usersEmail;
  @override
  @JsonKey(name: "users_password")
  String? get usersPassword;
  @override
  @JsonKey(name: "users_phone")
  String? get usersPhone;
  @override
  @JsonKey(name: "users_image")
  String? get usersImage;
  @override
  @JsonKey(name: "users_verifycode")
  int? get usersVerifycode;
  @override
  @JsonKey(name: "users_approve")
  int? get usersApprove;
  @override
  @JsonKey(name: "users_create")
  DateTime? get usersCreate;
  @override
  @JsonKey(name: "user_fav_branch_id")
  int? get userFavBranchId;
  @override
  @JsonKey(name: "users_is_Anonymous")
  int? get usersIsAnonymous;
  @override
  @JsonKey(name: "ordersCount")
  int? get ordersCount;
  @override
  @JsonKey(name: "totalsPrice")
  num? get totalsPrice;
  @override
  @JsonKey(name: "pickupOrdersPrice")
  num? get pickupOrdersPrice;
  @override
  @JsonKey(name: "pickupOrdersCount")
  int? get pickupOrdersCount;
  @override
  @JsonKey(name: "deliveryOrdersPrice")
  num? get deliveryOrdersPrice;
  @override
  @JsonKey(name: "deliveryOrdersCount")
  int? get deliveryOrdersCount;
  @override
  @JsonKey(ignore: true)
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
