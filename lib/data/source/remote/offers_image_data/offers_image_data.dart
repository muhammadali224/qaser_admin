import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';
import '../../../model/image_offer_model/image_offer_model.dart';

class OffersImageData {
  CRUD crud;

  OffersImageData(this.crud);

  getOffersImage() async {
    var response = await crud.postData(AppLink.viewOffersImage, {});
    return response.fold((l) => l, (r) => r);
  }

  editOffersImage({required ImageOfferModel imageOfferModel}) async {
    var response = await crud.postData(
      AppLink.editOffers,
      {
        "id": imageOfferModel.id.toString(),
        "isActive": imageOfferModel.isActive.toString(),
        "viewLevel": imageOfferModel.viewLevel.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteOffersImage(String imageId, String imageName) async {
    var response = await crud.postData(AppLink.deleteOffersImage, {
      'id': imageId,
      "imageName": imageName,
    });
    return response.fold((l) => l, (r) => r);
  }

  addOffersImage(ImageOfferModel imageOfferModel, File file) async {
    var response = await crud.addRequestWithImage(
      AppLink.addOffersImage,
      {
        "isActive": imageOfferModel.isActive.toString(),
        "viewLevel": imageOfferModel.viewLevel.toString(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }
}
