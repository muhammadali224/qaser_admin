import 'package:freezed_annotation/freezed_annotation.dart';

part 'branches_model.freezed.dart';
part 'branches_model.g.dart';

@Freezed()
class BranchModel with _$BranchModel {
  const factory BranchModel(
    int? id,
    String? branchNameAr,
    String? branchNameEn,
    int? isOpen,
    double? branchLat,
    double? branchLong,
    String? phoneNumber1,
    String? phoneNumber2,
    String? facebookUrl,
    double? deliveryCharge,
    int? isFixed,
    double? branchZone,
    double? deliveryFixCharge,
    double? branchMaxZone,
  ) = _BranchModel;

  factory BranchModel.fromJson(Map<String, Object?> json) =>
      _$BranchModelFromJson(json);
}
