class AppLink {
  static const String server = "https://qaser.mhjcode.com/admin";
  static const String test = "$server/test.php";

//============================== Images ==============================//
  static const String images = "https://qaser.mhjcode.com/upload";
  static const String imagesCategories = "$images/categories/";
  static const String imageUserProfile = "$images/user_profile/";
  static const String imageOffer = "$images/offers/";
  static const String imagesItems = "$images/items/";

//=============================== Auth ===============================//
  static const String login = "$server/auth/admin_login.php";
  static const String addAdminUser = "$server/auth/add.php";
  static const String editAdminUser = "$server/auth/edit.php";
  static const String viewAdminUser = "$server/auth/view.php";
  static const String deleteAdminUser = "$server/auth/delete.php";

//============================== Branches  ==============================//
  static const String getBranch = "$server/branches/view.php";
  static const String editBranch = "$server/branches/edit.php";
  static const String deleteBranch = "$server/branches/delete.php";
  static const String addBranch = "$server/branches/add.php";

//============================== Cash Auth ==============================//
  static const String addCashUser = "$server/cash_system/auth/add.php";
  static const String editCashUser = "$server/cash_system/auth/edit.php";
  static const String viewCashUser = "$server/cash_system/auth/view.php";
  static const String deleteCashUser = "$server/cash_system/auth/delete.php";

//============================ categories ==============================//
  static const String addCategories = "$server/categories/add.php";
  static const String editCategories = "$server/categories/edit.php";
  static const String editWithImageCategories =
      "$server/categories/edit_with_image.php";
  static const String viewCategories = "$server/categories/view.php";
  static const String deleteCategories = "$server/categories/delete.php";
  static const String addCategoriesToBranch =
      "$server/categories/add_to_branch.php";
  static const String removeCategoriesFromBranch =
      "$server/categories/remove_from_branch.php";

//============================ Weight And Size ==============================//
  static const String addWeightSize = "$server/weight_size/add.php";
  static const String editWeightSize = "$server/weight_size/edit.php";
  static const String viewWeightSize = "$server/weight_size/view.php";
  static const String deleteWeightSize = "$server/weight_size/delete.php";

//============================ Coupon ==============================//
  static const String addCoupon = "$server/coupon/add.php";
  static const String editCoupon = "$server/coupon/edit.php";
  static const String viewCoupon = "$server/coupon/view.php";
  static const String deleteCoupon = "$server/coupon/delete.php";

//============================ Users ==============================//
  static const String changeUserState = "$server/users/change_user_state.php";
  static const String sendUserNotification =
      "$server/users/send_notification.php";
  static const String viewUsers = "$server/users/view.php";
  static const String deleteUsers = "$server/users/delete.php";

//============================ Coupon ==============================//
  static const String addOffersImage = "$server/image_offers/add.php";
  static const String editOffers = "$server/image_offers/edit.php";
  static const String editOffersWithImage =
      "$server/image_offers/edit_with_image.php";
  static const String viewOffersImage = "$server/image_offers/view.php";
  static const String deleteOffersImage = "$server/image_offers/delete.php";

//============================== Items ==============================//
  static const String addItem = "$server/items/add.php";
  static const String editItem = "$server/items/edit.php";
  static const String editWithImageItem = "$server/items/edit_with_image.php";
  static const String viewItem = "$server/items/view.php";
  static const String deleteItem = "$server/items/delete.php";
  static const String addItemToBranch = "$server/items/add_to_branch.php";
  static const String removeItemFromBranch =
      "$server/items/remove_from_branch.php";
  static const String addItemWeight = "$server/items/add_weight.php";
  static const String removeItemWeight = "$server/items/remove_weight.php";
  static const String addItemImage = "$server/items/add_image.php";
  static const String deleteItemImage = "$server/items/delete_image.php";
}
