// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_size_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeightSizeModel _$WeightSizeModelFromJson(Map<String, dynamic> json) {
  return _WeightSizeModel.fromJson(json);
}

/// @nodoc
mixin _$WeightSizeModel {
  @JsonKey(name: "weight_size_id")
  int? get weightSizeId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_name")
  String? get subItemName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_name_ar")
  String? get subItemNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_item_value")
  num? get subItemValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeightSizeModelCopyWith<WeightSizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightSizeModelCopyWith<$Res> {
  factory $WeightSizeModelCopyWith(
          WeightSizeModel value, $Res Function(WeightSizeModel) then) =
      _$WeightSizeModelCopyWithImpl<$Res, WeightSizeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "weight_size_id") int? weightSizeId,
      @JsonKey(name: "sub_item_name") String? subItemName,
      @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
      @JsonKey(name: "sub_item_value") num? subItemValue});
}

/// @nodoc
class _$WeightSizeModelCopyWithImpl<$Res, $Val extends WeightSizeModel>
    implements $WeightSizeModelCopyWith<$Res> {
  _$WeightSizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightSizeId = freezed,
    Object? subItemName = freezed,
    Object? subItemNameAr = freezed,
    Object? subItemValue = freezed,
  }) {
    return _then(_value.copyWith(
      weightSizeId: freezed == weightSizeId
          ? _value.weightSizeId
          : weightSizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemName: freezed == subItemName
          ? _value.subItemName
          : subItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemNameAr: freezed == subItemNameAr
          ? _value.subItemNameAr
          : subItemNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemValue: freezed == subItemValue
          ? _value.subItemValue
          : subItemValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightSizeModelImplCopyWith<$Res>
    implements $WeightSizeModelCopyWith<$Res> {
  factory _$$WeightSizeModelImplCopyWith(_$WeightSizeModelImpl value,
          $Res Function(_$WeightSizeModelImpl) then) =
      __$$WeightSizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "weight_size_id") int? weightSizeId,
      @JsonKey(name: "sub_item_name") String? subItemName,
      @JsonKey(name: "sub_item_name_ar") String? subItemNameAr,
      @JsonKey(name: "sub_item_value") num? subItemValue});
}

/// @nodoc
class __$$WeightSizeModelImplCopyWithImpl<$Res>
    extends _$WeightSizeModelCopyWithImpl<$Res, _$WeightSizeModelImpl>
    implements _$$WeightSizeModelImplCopyWith<$Res> {
  __$$WeightSizeModelImplCopyWithImpl(
      _$WeightSizeModelImpl _value, $Res Function(_$WeightSizeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightSizeId = freezed,
    Object? subItemName = freezed,
    Object? subItemNameAr = freezed,
    Object? subItemValue = freezed,
  }) {
    return _then(_$WeightSizeModelImpl(
      weightSizeId: freezed == weightSizeId
          ? _value.weightSizeId
          : weightSizeId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemName: freezed == subItemName
          ? _value.subItemName
          : subItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemNameAr: freezed == subItemNameAr
          ? _value.subItemNameAr
          : subItemNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemValue: freezed == subItemValue
          ? _value.subItemValue
          : subItemValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightSizeModelImpl implements _WeightSizeModel {
  const _$WeightSizeModelImpl(
      {@JsonKey(name: "weight_size_id") this.weightSizeId,
      @JsonKey(name: "sub_item_name") this.subItemName,
      @JsonKey(name: "sub_item_name_ar") this.subItemNameAr,
      @JsonKey(name: "sub_item_value") this.subItemValue});

  factory _$WeightSizeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightSizeModelImplFromJson(json);

  @override
  @JsonKey(name: "weight_size_id")
  final int? weightSizeId;
  @override
  @JsonKey(name: "sub_item_name")
  final String? subItemName;
  @override
  @JsonKey(name: "sub_item_name_ar")
  final String? subItemNameAr;
  @override
  @JsonKey(name: "sub_item_value")
  final num? subItemValue;

  @override
  String toString() {
    return 'WeightSizeModel(weightSizeId: $weightSizeId, subItemName: $subItemName, subItemNameAr: $subItemNameAr, subItemValue: $subItemValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightSizeModelImpl &&
            (identical(other.weightSizeId, weightSizeId) ||
                other.weightSizeId == weightSizeId) &&
            (identical(other.subItemName, subItemName) ||
                other.subItemName == subItemName) &&
            (identical(other.subItemNameAr, subItemNameAr) ||
                other.subItemNameAr == subItemNameAr) &&
            (identical(other.subItemValue, subItemValue) ||
                other.subItemValue == subItemValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, weightSizeId, subItemName, subItemNameAr, subItemValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightSizeModelImplCopyWith<_$WeightSizeModelImpl> get copyWith =>
      __$$WeightSizeModelImplCopyWithImpl<_$WeightSizeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightSizeModelImplToJson(
      this,
    );
  }
}

abstract class _WeightSizeModel implements WeightSizeModel {
  const factory _WeightSizeModel(
          {@JsonKey(name: "weight_size_id") final int? weightSizeId,
          @JsonKey(name: "sub_item_name") final String? subItemName,
          @JsonKey(name: "sub_item_name_ar") final String? subItemNameAr,
          @JsonKey(name: "sub_item_value") final num? subItemValue}) =
      _$WeightSizeModelImpl;

  factory _WeightSizeModel.fromJson(Map<String, dynamic> json) =
      _$WeightSizeModelImpl.fromJson;

  @override
  @JsonKey(name: "weight_size_id")
  int? get weightSizeId;
  @override
  @JsonKey(name: "sub_item_name")
  String? get subItemName;
  @override
  @JsonKey(name: "sub_item_name_ar")
  String? get subItemNameAr;
  @override
  @JsonKey(name: "sub_item_value")
  num? get subItemValue;
  @override
  @JsonKey(ignore: true)
  _$$WeightSizeModelImplCopyWith<_$WeightSizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
