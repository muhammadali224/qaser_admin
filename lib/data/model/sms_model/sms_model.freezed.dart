// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SmsModel _$SmsModelFromJson(Map<String, dynamic> json) {
  return _SmsModel.fromJson(json);
}

/// @nodoc
mixin _$SmsModel {
  @JsonKey(name: "api_version")
  String? get apiVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "from")
  String? get from => throw _privateConstructorUsedError;
  @JsonKey(name: "to")
  String? get to => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: "operator")
  String? get smsModelOperator => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created")
  String? get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: "date_sent")
  String? get dateSent => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "status_description")
  dynamic get statusDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "timezone")
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "price_unit")
  String? get priceUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "flag")
  dynamic get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmsModelCopyWith<SmsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsModelCopyWith<$Res> {
  factory $SmsModelCopyWith(SmsModel value, $Res Function(SmsModel) then) =
      _$SmsModelCopyWithImpl<$Res, SmsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "api_version") String? apiVersion,
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
      @JsonKey(name: "flag") dynamic flag});
}

/// @nodoc
class _$SmsModelCopyWithImpl<$Res, $Val extends SmsModel>
    implements $SmsModelCopyWith<$Res> {
  _$SmsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = freezed,
    Object? id = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? region = freezed,
    Object? smsModelOperator = freezed,
    Object? content = freezed,
    Object? dateCreated = freezed,
    Object? dateSent = freezed,
    Object? status = freezed,
    Object? statusDescription = freezed,
    Object? timezone = freezed,
    Object? price = freezed,
    Object? priceUnit = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      smsModelOperator: freezed == smsModelOperator
          ? _value.smsModelOperator
          : smsModelOperator // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: freezed == dateSent
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDescription: freezed == statusDescription
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUnit: freezed == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmsModelImplCopyWith<$Res>
    implements $SmsModelCopyWith<$Res> {
  factory _$$SmsModelImplCopyWith(
          _$SmsModelImpl value, $Res Function(_$SmsModelImpl) then) =
      __$$SmsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "api_version") String? apiVersion,
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
      @JsonKey(name: "flag") dynamic flag});
}

/// @nodoc
class __$$SmsModelImplCopyWithImpl<$Res>
    extends _$SmsModelCopyWithImpl<$Res, _$SmsModelImpl>
    implements _$$SmsModelImplCopyWith<$Res> {
  __$$SmsModelImplCopyWithImpl(
      _$SmsModelImpl _value, $Res Function(_$SmsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiVersion = freezed,
    Object? id = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? region = freezed,
    Object? smsModelOperator = freezed,
    Object? content = freezed,
    Object? dateCreated = freezed,
    Object? dateSent = freezed,
    Object? status = freezed,
    Object? statusDescription = freezed,
    Object? timezone = freezed,
    Object? price = freezed,
    Object? priceUnit = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$SmsModelImpl(
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      smsModelOperator: freezed == smsModelOperator
          ? _value.smsModelOperator
          : smsModelOperator // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: freezed == dateSent
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDescription: freezed == statusDescription
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUnit: freezed == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmsModelImpl implements _SmsModel {
  const _$SmsModelImpl(
      {@JsonKey(name: "api_version") this.apiVersion,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "from") this.from,
      @JsonKey(name: "to") this.to,
      @JsonKey(name: "region") this.region,
      @JsonKey(name: "operator") this.smsModelOperator,
      @JsonKey(name: "content") this.content,
      @JsonKey(name: "date_created") this.dateCreated,
      @JsonKey(name: "date_sent") this.dateSent,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "status_description") this.statusDescription,
      @JsonKey(name: "timezone") this.timezone,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "price_unit") this.priceUnit,
      @JsonKey(name: "flag") this.flag});

  factory _$SmsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmsModelImplFromJson(json);

  @override
  @JsonKey(name: "api_version")
  final String? apiVersion;
  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "from")
  final String? from;
  @override
  @JsonKey(name: "to")
  final String? to;
  @override
  @JsonKey(name: "region")
  final String? region;
  @override
  @JsonKey(name: "operator")
  final String? smsModelOperator;
  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "date_created")
  final String? dateCreated;
  @override
  @JsonKey(name: "date_sent")
  final String? dateSent;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "status_description")
  final dynamic statusDescription;
  @override
  @JsonKey(name: "timezone")
  final String? timezone;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "price_unit")
  final String? priceUnit;
  @override
  @JsonKey(name: "flag")
  final dynamic flag;

  @override
  String toString() {
    return 'SmsModel(apiVersion: $apiVersion, id: $id, from: $from, to: $to, region: $region, smsModelOperator: $smsModelOperator, content: $content, dateCreated: $dateCreated, dateSent: $dateSent, status: $status, statusDescription: $statusDescription, timezone: $timezone, price: $price, priceUnit: $priceUnit, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmsModelImpl &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.smsModelOperator, smsModelOperator) ||
                other.smsModelOperator == smsModelOperator) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateSent, dateSent) ||
                other.dateSent == dateSent) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.statusDescription, statusDescription) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceUnit, priceUnit) ||
                other.priceUnit == priceUnit) &&
            const DeepCollectionEquality().equals(other.flag, flag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiVersion,
      id,
      from,
      to,
      region,
      smsModelOperator,
      content,
      dateCreated,
      dateSent,
      status,
      const DeepCollectionEquality().hash(statusDescription),
      timezone,
      price,
      priceUnit,
      const DeepCollectionEquality().hash(flag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmsModelImplCopyWith<_$SmsModelImpl> get copyWith =>
      __$$SmsModelImplCopyWithImpl<_$SmsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmsModelImplToJson(
      this,
    );
  }
}

abstract class _SmsModel implements SmsModel {
  const factory _SmsModel(
      {@JsonKey(name: "api_version") final String? apiVersion,
      @JsonKey(name: "id") final int? id,
      @JsonKey(name: "from") final String? from,
      @JsonKey(name: "to") final String? to,
      @JsonKey(name: "region") final String? region,
      @JsonKey(name: "operator") final String? smsModelOperator,
      @JsonKey(name: "content") final String? content,
      @JsonKey(name: "date_created") final String? dateCreated,
      @JsonKey(name: "date_sent") final String? dateSent,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "status_description") final dynamic statusDescription,
      @JsonKey(name: "timezone") final String? timezone,
      @JsonKey(name: "price") final double? price,
      @JsonKey(name: "price_unit") final String? priceUnit,
      @JsonKey(name: "flag") final dynamic flag}) = _$SmsModelImpl;

  factory _SmsModel.fromJson(Map<String, dynamic> json) =
      _$SmsModelImpl.fromJson;

  @override
  @JsonKey(name: "api_version")
  String? get apiVersion;
  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "from")
  String? get from;
  @override
  @JsonKey(name: "to")
  String? get to;
  @override
  @JsonKey(name: "region")
  String? get region;
  @override
  @JsonKey(name: "operator")
  String? get smsModelOperator;
  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(name: "date_created")
  String? get dateCreated;
  @override
  @JsonKey(name: "date_sent")
  String? get dateSent;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "status_description")
  dynamic get statusDescription;
  @override
  @JsonKey(name: "timezone")
  String? get timezone;
  @override
  @JsonKey(name: "price")
  double? get price;
  @override
  @JsonKey(name: "price_unit")
  String? get priceUnit;
  @override
  @JsonKey(name: "flag")
  dynamic get flag;
  @override
  @JsonKey(ignore: true)
  _$$SmsModelImplCopyWith<_$SmsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
