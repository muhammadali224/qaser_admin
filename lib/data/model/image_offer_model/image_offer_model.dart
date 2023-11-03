// To parse this JSON data, do
//
//     final imageOfferModel = imageOfferModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_offer_model.freezed.dart';
part 'image_offer_model.g.dart';

ImageOfferModel imageOfferModelFromJson(String str) =>
    ImageOfferModel.fromJson(json.decode(str));

String imageOfferModelToJson(ImageOfferModel data) =>
    json.encode(data.toJson());

@freezed
class ImageOfferModel with _$ImageOfferModel {
  const factory ImageOfferModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "offer_image_url") String? offerImageUrl,
    @JsonKey(name: "isActive") int? isActive,
    @JsonKey(name: "view_level") int? viewLevel,
  }) = _ImageOfferModel;

  factory ImageOfferModel.fromJson(Map<String, dynamic> json) =>
      _$ImageOfferModelFromJson(json);
}
