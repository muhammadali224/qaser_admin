// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubItemsModel _$SubItemsModelFromJson(Map<String, dynamic> json) {
  return _SubItemsModel.fromJson(json);
}

/// @nodoc
mixin _$SubItemsModel {
  @JsonKey(name: "sub_item_id")
  int? get subItemId => throw _privateConstructorUsedError;
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_name")
  String? get subItemsName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_name_ar")
  String? get subItemsNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_items_price")
  num? get subItemsPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubItemsModelCopyWith<SubItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemsModelCopyWith<$Res> {
  factory $SubItemsModelCopyWith(
          SubItemsModel value, $Res Function(SubItemsModel) then) =
      _$SubItemsModelCopyWithImpl<$Res, SubItemsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "sub_item_id") int? subItemId,
      @JsonKey(name: "item_id") int? itemId,
      @JsonKey(name: "sub_items_name") String? subItemsName,
      @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
      @JsonKey(name: "sub_items_price") num? subItemsPrice});
}

/// @nodoc
class _$SubItemsModelCopyWithImpl<$Res, $Val extends SubItemsModel>
    implements $SubItemsModelCopyWith<$Res> {
  _$SubItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subItemId = freezed,
    Object? itemId = freezed,
    Object? subItemsName = freezed,
    Object? subItemsNameAr = freezed,
    Object? subItemsPrice = freezed,
  }) {
    return _then(_value.copyWith(
      subItemId: freezed == subItemId
          ? _value.subItemId
          : subItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemsName: freezed == subItemsName
          ? _value.subItemsName
          : subItemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsNameAr: freezed == subItemsNameAr
          ? _value.subItemsNameAr
          : subItemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsPrice: freezed == subItemsPrice
          ? _value.subItemsPrice
          : subItemsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubItemsModelImplCopyWith<$Res>
    implements $SubItemsModelCopyWith<$Res> {
  factory _$$SubItemsModelImplCopyWith(
          _$SubItemsModelImpl value, $Res Function(_$SubItemsModelImpl) then) =
      __$$SubItemsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sub_item_id") int? subItemId,
      @JsonKey(name: "item_id") int? itemId,
      @JsonKey(name: "sub_items_name") String? subItemsName,
      @JsonKey(name: "sub_items_name_ar") String? subItemsNameAr,
      @JsonKey(name: "sub_items_price") num? subItemsPrice});
}

/// @nodoc
class __$$SubItemsModelImplCopyWithImpl<$Res>
    extends _$SubItemsModelCopyWithImpl<$Res, _$SubItemsModelImpl>
    implements _$$SubItemsModelImplCopyWith<$Res> {
  __$$SubItemsModelImplCopyWithImpl(
      _$SubItemsModelImpl _value, $Res Function(_$SubItemsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subItemId = freezed,
    Object? itemId = freezed,
    Object? subItemsName = freezed,
    Object? subItemsNameAr = freezed,
    Object? subItemsPrice = freezed,
  }) {
    return _then(_$SubItemsModelImpl(
      subItemId: freezed == subItemId
          ? _value.subItemId
          : subItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      subItemsName: freezed == subItemsName
          ? _value.subItemsName
          : subItemsName // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsNameAr: freezed == subItemsNameAr
          ? _value.subItemsNameAr
          : subItemsNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      subItemsPrice: freezed == subItemsPrice
          ? _value.subItemsPrice
          : subItemsPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubItemsModelImpl implements _SubItemsModel {
  const _$SubItemsModelImpl(
      {@JsonKey(name: "sub_item_id") this.subItemId,
      @JsonKey(name: "item_id") this.itemId,
      @JsonKey(name: "sub_items_name") this.subItemsName,
      @JsonKey(name: "sub_items_name_ar") this.subItemsNameAr,
      @JsonKey(name: "sub_items_price") this.subItemsPrice});

  factory _$SubItemsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubItemsModelImplFromJson(json);

  @override
  @JsonKey(name: "sub_item_id")
  final int? subItemId;
  @override
  @JsonKey(name: "item_id")
  final int? itemId;
  @override
  @JsonKey(name: "sub_items_name")
  final String? subItemsName;
  @override
  @JsonKey(name: "sub_items_name_ar")
  final String? subItemsNameAr;
  @override
  @JsonKey(name: "sub_items_price")
  final num? subItemsPrice;

  @override
  String toString() {
    return 'SubItemsModel(subItemId: $subItemId, itemId: $itemId, subItemsName: $subItemsName, subItemsNameAr: $subItemsNameAr, subItemsPrice: $subItemsPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubItemsModelImpl &&
            (identical(other.subItemId, subItemId) ||
                other.subItemId == subItemId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.subItemsName, subItemsName) ||
                other.subItemsName == subItemsName) &&
            (identical(other.subItemsNameAr, subItemsNameAr) ||
                other.subItemsNameAr == subItemsNameAr) &&
            (identical(other.subItemsPrice, subItemsPrice) ||
                other.subItemsPrice == subItemsPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, subItemId, itemId, subItemsName,
      subItemsNameAr, subItemsPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubItemsModelImplCopyWith<_$SubItemsModelImpl> get copyWith =>
      __$$SubItemsModelImplCopyWithImpl<_$SubItemsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubItemsModelImplToJson(
      this,
    );
  }
}

abstract class _SubItemsModel implements SubItemsModel {
  const factory _SubItemsModel(
          {@JsonKey(name: "sub_item_id") final int? subItemId,
          @JsonKey(name: "item_id") final int? itemId,
          @JsonKey(name: "sub_items_name") final String? subItemsName,
          @JsonKey(name: "sub_items_name_ar") final String? subItemsNameAr,
          @JsonKey(name: "sub_items_price") final num? subItemsPrice}) =
      _$SubItemsModelImpl;

  factory _SubItemsModel.fromJson(Map<String, dynamic> json) =
      _$SubItemsModelImpl.fromJson;

  @override
  @JsonKey(name: "sub_item_id")
  int? get subItemId;
  @override
  @JsonKey(name: "item_id")
  int? get itemId;
  @override
  @JsonKey(name: "sub_items_name")
  String? get subItemsName;
  @override
  @JsonKey(name: "sub_items_name_ar")
  String? get subItemsNameAr;
  @override
  @JsonKey(name: "sub_items_price")
  num? get subItemsPrice;
  @override
  @JsonKey(ignore: true)
  _$$SubItemsModelImplCopyWith<_$SubItemsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
