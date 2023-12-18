// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageOfferModel _$ImageOfferModelFromJson(Map<String, dynamic> json) {
  return _ImageOfferModel.fromJson(json);
}

/// @nodoc
mixin _$ImageOfferModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "offer_image_url")
  String? get offerImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "view_level")
  int? get viewLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageOfferModelCopyWith<ImageOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageOfferModelCopyWith<$Res> {
  factory $ImageOfferModelCopyWith(
          ImageOfferModel value, $Res Function(ImageOfferModel) then) =
      _$ImageOfferModelCopyWithImpl<$Res, ImageOfferModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "offer_image_url") String? offerImageUrl,
      @JsonKey(name: "isActive") int? isActive,
      @JsonKey(name: "view_level") int? viewLevel});
}

/// @nodoc
class _$ImageOfferModelCopyWithImpl<$Res, $Val extends ImageOfferModel>
    implements $ImageOfferModelCopyWith<$Res> {
  _$ImageOfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? offerImageUrl = freezed,
    Object? isActive = freezed,
    Object? viewLevel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      offerImageUrl: freezed == offerImageUrl
          ? _value.offerImageUrl
          : offerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      viewLevel: freezed == viewLevel
          ? _value.viewLevel
          : viewLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageOfferModelImplCopyWith<$Res>
    implements $ImageOfferModelCopyWith<$Res> {
  factory _$$ImageOfferModelImplCopyWith(_$ImageOfferModelImpl value,
          $Res Function(_$ImageOfferModelImpl) then) =
      __$$ImageOfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "offer_image_url") String? offerImageUrl,
      @JsonKey(name: "isActive") int? isActive,
      @JsonKey(name: "view_level") int? viewLevel});
}

/// @nodoc
class __$$ImageOfferModelImplCopyWithImpl<$Res>
    extends _$ImageOfferModelCopyWithImpl<$Res, _$ImageOfferModelImpl>
    implements _$$ImageOfferModelImplCopyWith<$Res> {
  __$$ImageOfferModelImplCopyWithImpl(
      _$ImageOfferModelImpl _value, $Res Function(_$ImageOfferModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? offerImageUrl = freezed,
    Object? isActive = freezed,
    Object? viewLevel = freezed,
  }) {
    return _then(_$ImageOfferModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      offerImageUrl: freezed == offerImageUrl
          ? _value.offerImageUrl
          : offerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      viewLevel: freezed == viewLevel
          ? _value.viewLevel
          : viewLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageOfferModelImpl implements _ImageOfferModel {
  const _$ImageOfferModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "offer_image_url") this.offerImageUrl,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "view_level") this.viewLevel});

  factory _$ImageOfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageOfferModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "offer_image_url")
  final String? offerImageUrl;
  @override
  @JsonKey(name: "isActive")
  final int? isActive;
  @override
  @JsonKey(name: "view_level")
  final int? viewLevel;

  @override
  String toString() {
    return 'ImageOfferModel(id: $id, offerImageUrl: $offerImageUrl, isActive: $isActive, viewLevel: $viewLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageOfferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerImageUrl, offerImageUrl) ||
                other.offerImageUrl == offerImageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.viewLevel, viewLevel) ||
                other.viewLevel == viewLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, offerImageUrl, isActive, viewLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageOfferModelImplCopyWith<_$ImageOfferModelImpl> get copyWith =>
      __$$ImageOfferModelImplCopyWithImpl<_$ImageOfferModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageOfferModelImplToJson(
      this,
    );
  }
}

abstract class _ImageOfferModel implements ImageOfferModel {
  const factory _ImageOfferModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "offer_image_url") final String? offerImageUrl,
          @JsonKey(name: "isActive") final int? isActive,
          @JsonKey(name: "view_level") final int? viewLevel}) =
      _$ImageOfferModelImpl;

  factory _ImageOfferModel.fromJson(Map<String, dynamic> json) =
      _$ImageOfferModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "offer_image_url")
  String? get offerImageUrl;
  @override
  @JsonKey(name: "isActive")
  int? get isActive;
  @override
  @JsonKey(name: "view_level")
  int? get viewLevel;
  @override
  @JsonKey(ignore: true)
  _$$ImageOfferModelImplCopyWith<_$ImageOfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
