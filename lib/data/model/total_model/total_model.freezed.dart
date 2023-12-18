// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TotalModel _$TotalModelFromJson(Map<String, dynamic> json) {
  return _TotalModel.fromJson(json);
}

/// @nodoc
mixin _$TotalModel {
  @JsonKey(name: "branch_id")
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: "branch_name_ar")
  String? get branchNameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "order_year")
  int? get orderYear => throw _privateConstructorUsedError;
  @JsonKey(name: "order_month")
  int? get orderMonth => throw _privateConstructorUsedError;
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
  $TotalModelCopyWith<TotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalModelCopyWith<$Res> {
  factory $TotalModelCopyWith(
          TotalModel value, $Res Function(TotalModel) then) =
      _$TotalModelCopyWithImpl<$Res, TotalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "branch_id") int? branchId,
      @JsonKey(name: "branch_name_ar") String? branchNameAr,
      @JsonKey(name: "order_year") int? orderYear,
      @JsonKey(name: "order_month") int? orderMonth,
      @JsonKey(name: "ordersCount") int? ordersCount,
      @JsonKey(name: "totalsPrice") num? totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") num? pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") int? pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") num? deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount});
}

/// @nodoc
class _$TotalModelCopyWithImpl<$Res, $Val extends TotalModel>
    implements $TotalModelCopyWith<$Res> {
  _$TotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? branchNameAr = freezed,
    Object? orderYear = freezed,
    Object? orderMonth = freezed,
    Object? ordersCount = freezed,
    Object? totalsPrice = freezed,
    Object? pickupOrdersPrice = freezed,
    Object? pickupOrdersCount = freezed,
    Object? deliveryOrdersPrice = freezed,
    Object? deliveryOrdersCount = freezed,
  }) {
    return _then(_value.copyWith(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchNameAr: freezed == branchNameAr
          ? _value.branchNameAr
          : branchNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      orderYear: freezed == orderYear
          ? _value.orderYear
          : orderYear // ignore: cast_nullable_to_non_nullable
              as int?,
      orderMonth: freezed == orderMonth
          ? _value.orderMonth
          : orderMonth // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TotalModelImplCopyWith<$Res>
    implements $TotalModelCopyWith<$Res> {
  factory _$$TotalModelImplCopyWith(
          _$TotalModelImpl value, $Res Function(_$TotalModelImpl) then) =
      __$$TotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "branch_id") int? branchId,
      @JsonKey(name: "branch_name_ar") String? branchNameAr,
      @JsonKey(name: "order_year") int? orderYear,
      @JsonKey(name: "order_month") int? orderMonth,
      @JsonKey(name: "ordersCount") int? ordersCount,
      @JsonKey(name: "totalsPrice") num? totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") num? pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") int? pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") num? deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount") int? deliveryOrdersCount});
}

/// @nodoc
class __$$TotalModelImplCopyWithImpl<$Res>
    extends _$TotalModelCopyWithImpl<$Res, _$TotalModelImpl>
    implements _$$TotalModelImplCopyWith<$Res> {
  __$$TotalModelImplCopyWithImpl(
      _$TotalModelImpl _value, $Res Function(_$TotalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? branchNameAr = freezed,
    Object? orderYear = freezed,
    Object? orderMonth = freezed,
    Object? ordersCount = freezed,
    Object? totalsPrice = freezed,
    Object? pickupOrdersPrice = freezed,
    Object? pickupOrdersCount = freezed,
    Object? deliveryOrdersPrice = freezed,
    Object? deliveryOrdersCount = freezed,
  }) {
    return _then(_$TotalModelImpl(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchNameAr: freezed == branchNameAr
          ? _value.branchNameAr
          : branchNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      orderYear: freezed == orderYear
          ? _value.orderYear
          : orderYear // ignore: cast_nullable_to_non_nullable
              as int?,
      orderMonth: freezed == orderMonth
          ? _value.orderMonth
          : orderMonth // ignore: cast_nullable_to_non_nullable
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
class _$TotalModelImpl implements _TotalModel {
  const _$TotalModelImpl(
      {@JsonKey(name: "branch_id") this.branchId,
      @JsonKey(name: "branch_name_ar") this.branchNameAr,
      @JsonKey(name: "order_year") this.orderYear,
      @JsonKey(name: "order_month") this.orderMonth,
      @JsonKey(name: "ordersCount") this.ordersCount,
      @JsonKey(name: "totalsPrice") this.totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") this.pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") this.pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") this.deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount") this.deliveryOrdersCount});

  factory _$TotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalModelImplFromJson(json);

  @override
  @JsonKey(name: "branch_id")
  final int? branchId;
  @override
  @JsonKey(name: "branch_name_ar")
  final String? branchNameAr;
  @override
  @JsonKey(name: "order_year")
  final int? orderYear;
  @override
  @JsonKey(name: "order_month")
  final int? orderMonth;
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
    return 'TotalModel(branchId: $branchId, branchNameAr: $branchNameAr, orderYear: $orderYear, orderMonth: $orderMonth, ordersCount: $ordersCount, totalsPrice: $totalsPrice, pickupOrdersPrice: $pickupOrdersPrice, pickupOrdersCount: $pickupOrdersCount, deliveryOrdersPrice: $deliveryOrdersPrice, deliveryOrdersCount: $deliveryOrdersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalModelImpl &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.branchNameAr, branchNameAr) ||
                other.branchNameAr == branchNameAr) &&
            (identical(other.orderYear, orderYear) ||
                other.orderYear == orderYear) &&
            (identical(other.orderMonth, orderMonth) ||
                other.orderMonth == orderMonth) &&
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
      branchId,
      branchNameAr,
      orderYear,
      orderMonth,
      ordersCount,
      totalsPrice,
      pickupOrdersPrice,
      pickupOrdersCount,
      deliveryOrdersPrice,
      deliveryOrdersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalModelImplCopyWith<_$TotalModelImpl> get copyWith =>
      __$$TotalModelImplCopyWithImpl<_$TotalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalModelImplToJson(
      this,
    );
  }
}

abstract class _TotalModel implements TotalModel {
  const factory _TotalModel(
      {@JsonKey(name: "branch_id") final int? branchId,
      @JsonKey(name: "branch_name_ar") final String? branchNameAr,
      @JsonKey(name: "order_year") final int? orderYear,
      @JsonKey(name: "order_month") final int? orderMonth,
      @JsonKey(name: "ordersCount") final int? ordersCount,
      @JsonKey(name: "totalsPrice") final num? totalsPrice,
      @JsonKey(name: "pickupOrdersPrice") final num? pickupOrdersPrice,
      @JsonKey(name: "pickupOrdersCount") final int? pickupOrdersCount,
      @JsonKey(name: "deliveryOrdersPrice") final num? deliveryOrdersPrice,
      @JsonKey(name: "deliveryOrdersCount")
      final int? deliveryOrdersCount}) = _$TotalModelImpl;

  factory _TotalModel.fromJson(Map<String, dynamic> json) =
      _$TotalModelImpl.fromJson;

  @override
  @JsonKey(name: "branch_id")
  int? get branchId;
  @override
  @JsonKey(name: "branch_name_ar")
  String? get branchNameAr;
  @override
  @JsonKey(name: "order_year")
  int? get orderYear;
  @override
  @JsonKey(name: "order_month")
  int? get orderMonth;
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
  _$$TotalModelImplCopyWith<_$TotalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
