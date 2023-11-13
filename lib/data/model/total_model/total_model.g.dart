// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotalModelImpl _$$TotalModelImplFromJson(Map<String, dynamic> json) =>
    _$TotalModelImpl(
      branchId: json['branch_id'] as int?,
      branchNameAr: json['branch_name_ar'] as String?,
      orderYear: json['order_year'] as int?,
      orderMonth: json['order_month'] as int?,
      ordersCount: json['ordersCount'] as int?,
      totalsPrice: json['totalsPrice'] as num?,
      pickupOrdersPrice: json['pickupOrdersPrice'] as num?,
      pickupOrdersCount: json['pickupOrdersCount'] as int?,
      deliveryOrdersPrice: json['deliveryOrdersPrice'] as num?,
      deliveryOrdersCount: json['deliveryOrdersCount'] as int?,
    );

Map<String, dynamic> _$$TotalModelImplToJson(_$TotalModelImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'branch_name_ar': instance.branchNameAr,
      'order_year': instance.orderYear,
      'order_month': instance.orderMonth,
      'ordersCount': instance.ordersCount,
      'totalsPrice': instance.totalsPrice,
      'pickupOrdersPrice': instance.pickupOrdersPrice,
      'pickupOrdersCount': instance.pickupOrdersCount,
      'deliveryOrdersPrice': instance.deliveryOrdersPrice,
      'deliveryOrdersCount': instance.deliveryOrdersCount,
    };
