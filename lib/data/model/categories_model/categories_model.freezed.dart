// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) {
  return _CategoriesModel.fromJson(json);
}

/// @nodoc
mixin _$CategoriesModel {
  @JsonKey(name: "categories_id")
  int? get categoriesId => throw _privateConstructorUsedError;
  @JsonKey(name: "categories_name")
  String? get categoriesName => throw _privateConstructorUsedError;
  @JsonKey(name: "categories_name_ar")
  String? get categoriesNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "categories_image")
  String? get categoriesImage => throw _privateConstructorUsedError;
  @JsonKey(name: "categories_datetime")
  DateTime? get categoriesDatetime => throw _privateConstructorUsedError;
  @JsonKey(name: "branch_ids")
  List<String>? get branchIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoriesModelCopyWith<CategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesModelCopyWith<$Res> {
  factory $CategoriesModelCopyWith(
          CategoriesModel value, $Res Function(CategoriesModel) then) =
      _$CategoriesModelCopyWithImpl<$Res, CategoriesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "categories_id") int? categoriesId,
      @JsonKey(name: "categories_name") String? categoriesName,
      @JsonKey(name: "categories_name_ar") String? categoriesNameAr,
      @JsonKey(name: "categories_image") String? categoriesImage,
      @JsonKey(name: "categories_datetime") DateTime? categoriesDatetime,
      @JsonKey(name: "branch_ids") List<String>? branchIds});
}

/// @nodoc
class _$CategoriesModelCopyWithImpl<$Res, $Val extends CategoriesModel>
    implements $CategoriesModelCopyWith<$Res> {
  _$CategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesId = freezed,
    Object? categoriesName = freezed,
    Object? categoriesNameAr = freezed,
    Object? categoriesImage = freezed,
    Object? categoriesDatetime = freezed,
    Object? branchIds = freezed,
  }) {
    return _then(_value.copyWith(
      categoriesId: freezed == categoriesId
          ? _value.categoriesId
          : categoriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoriesName: freezed == categoriesName
          ? _value.categoriesName
          : categoriesName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesNameAr: freezed == categoriesNameAr
          ? _value.categoriesNameAr
          : categoriesNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesImage: freezed == categoriesImage
          ? _value.categoriesImage
          : categoriesImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesDatetime: freezed == categoriesDatetime
          ? _value.categoriesDatetime
          : categoriesDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      branchIds: freezed == branchIds
          ? _value.branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesModelImplCopyWith<$Res>
    implements $CategoriesModelCopyWith<$Res> {
  factory _$$CategoriesModelImplCopyWith(_$CategoriesModelImpl value,
          $Res Function(_$CategoriesModelImpl) then) =
      __$$CategoriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "categories_id") int? categoriesId,
      @JsonKey(name: "categories_name") String? categoriesName,
      @JsonKey(name: "categories_name_ar") String? categoriesNameAr,
      @JsonKey(name: "categories_image") String? categoriesImage,
      @JsonKey(name: "categories_datetime") DateTime? categoriesDatetime,
      @JsonKey(name: "branch_ids") List<String>? branchIds});
}

/// @nodoc
class __$$CategoriesModelImplCopyWithImpl<$Res>
    extends _$CategoriesModelCopyWithImpl<$Res, _$CategoriesModelImpl>
    implements _$$CategoriesModelImplCopyWith<$Res> {
  __$$CategoriesModelImplCopyWithImpl(
      _$CategoriesModelImpl _value, $Res Function(_$CategoriesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesId = freezed,
    Object? categoriesName = freezed,
    Object? categoriesNameAr = freezed,
    Object? categoriesImage = freezed,
    Object? categoriesDatetime = freezed,
    Object? branchIds = freezed,
  }) {
    return _then(_$CategoriesModelImpl(
      categoriesId: freezed == categoriesId
          ? _value.categoriesId
          : categoriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoriesName: freezed == categoriesName
          ? _value.categoriesName
          : categoriesName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesNameAr: freezed == categoriesNameAr
          ? _value.categoriesNameAr
          : categoriesNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesImage: freezed == categoriesImage
          ? _value.categoriesImage
          : categoriesImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesDatetime: freezed == categoriesDatetime
          ? _value.categoriesDatetime
          : categoriesDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      branchIds: freezed == branchIds
          ? _value._branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriesModelImpl implements _CategoriesModel {
  const _$CategoriesModelImpl(
      {@JsonKey(name: "categories_id") this.categoriesId,
      @JsonKey(name: "categories_name") this.categoriesName,
      @JsonKey(name: "categories_name_ar") this.categoriesNameAr,
      @JsonKey(name: "categories_image") this.categoriesImage,
      @JsonKey(name: "categories_datetime") this.categoriesDatetime,
      @JsonKey(name: "branch_ids") final List<String>? branchIds})
      : _branchIds = branchIds;

  factory _$CategoriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesModelImplFromJson(json);

  @override
  @JsonKey(name: "categories_id")
  final int? categoriesId;
  @override
  @JsonKey(name: "categories_name")
  final String? categoriesName;
  @override
  @JsonKey(name: "categories_name_ar")
  final String? categoriesNameAr;
  @override
  @JsonKey(name: "categories_image")
  final String? categoriesImage;
  @override
  @JsonKey(name: "categories_datetime")
  final DateTime? categoriesDatetime;
  final List<String>? _branchIds;
  @override
  @JsonKey(name: "branch_ids")
  List<String>? get branchIds {
    final value = _branchIds;
    if (value == null) return null;
    if (_branchIds is EqualUnmodifiableListView) return _branchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoriesModel(categoriesId: $categoriesId, categoriesName: $categoriesName, categoriesNameAr: $categoriesNameAr, categoriesImage: $categoriesImage, categoriesDatetime: $categoriesDatetime, branchIds: $branchIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesModelImpl &&
            (identical(other.categoriesId, categoriesId) ||
                other.categoriesId == categoriesId) &&
            (identical(other.categoriesName, categoriesName) ||
                other.categoriesName == categoriesName) &&
            (identical(other.categoriesNameAr, categoriesNameAr) ||
                other.categoriesNameAr == categoriesNameAr) &&
            (identical(other.categoriesImage, categoriesImage) ||
                other.categoriesImage == categoriesImage) &&
            (identical(other.categoriesDatetime, categoriesDatetime) ||
                other.categoriesDatetime == categoriesDatetime) &&
            const DeepCollectionEquality()
                .equals(other._branchIds, _branchIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoriesId,
      categoriesName,
      categoriesNameAr,
      categoriesImage,
      categoriesDatetime,
      const DeepCollectionEquality().hash(_branchIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesModelImplCopyWith<_$CategoriesModelImpl> get copyWith =>
      __$$CategoriesModelImplCopyWithImpl<_$CategoriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesModelImplToJson(
      this,
    );
  }
}

abstract class _CategoriesModel implements CategoriesModel {
  const factory _CategoriesModel(
      {@JsonKey(name: "categories_id") final int? categoriesId,
      @JsonKey(name: "categories_name") final String? categoriesName,
      @JsonKey(name: "categories_name_ar") final String? categoriesNameAr,
      @JsonKey(name: "categories_image") final String? categoriesImage,
      @JsonKey(name: "categories_datetime") final DateTime? categoriesDatetime,
      @JsonKey(name: "branch_ids")
      final List<String>? branchIds}) = _$CategoriesModelImpl;

  factory _CategoriesModel.fromJson(Map<String, dynamic> json) =
      _$CategoriesModelImpl.fromJson;

  @override
  @JsonKey(name: "categories_id")
  int? get categoriesId;
  @override
  @JsonKey(name: "categories_name")
  String? get categoriesName;
  @override
  @JsonKey(name: "categories_name_ar")
  String? get categoriesNameAr;
  @override
  @JsonKey(name: "categories_image")
  String? get categoriesImage;
  @override
  @JsonKey(name: "categories_datetime")
  DateTime? get categoriesDatetime;
  @override
  @JsonKey(name: "branch_ids")
  List<String>? get branchIds;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesModelImplCopyWith<_$CategoriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
