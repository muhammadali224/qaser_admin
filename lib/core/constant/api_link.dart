import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLink {
  static String server = dotenv.env['SERVER']!;
  static String images = dotenv.env['IMAGES']!;

//============================== Images ==============================//
  static String imagesCategories = "$images/categories/";
  static String imageUserProfile = "$images/user_profile/";
  static String imageOffer = "$images/offers/";
  static String imagesItems = "$images/items/";

//=============================== Auth ===============================//
  static String login = "$server/auth/admin_login.php";
  static String addAdminUser = "$server/auth/add.php";
  static String editAdminUser = "$server/auth/edit.php";
  static String viewAdminUser = "$server/auth/view.php";
  static String deleteAdminUser = "$server/auth/delete.php";
//============================== Home  ==============================//
  static String getSummery = "$server/home/home.php";

//============================== Branches  ==============================//
  static String getBranch = "$server/branches/view.php";
  static String editBranch = "$server/branches/edit.php";
  static String deleteBranch = "$server/branches/delete.php";
  static String addBranch = "$server/branches/add.php";

//============================== Cash Auth ==============================//
  static String addCashUser = "$server/cash_system/auth/add.php";
  static String editCashUser = "$server/cash_system/auth/edit.php";
  static String viewCashUser = "$server/cash_system/auth/view.php";
  static String deleteCashUser = "$server/cash_system/auth/delete.php";

//============================ categories ==============================//
  static String addCategories = "$server/categories/add.php";
  static String editCategories = "$server/categories/edit.php";
  static String editWithImageCategories =
      "$server/categories/edit_with_image.php";
  static String viewCategories = "$server/categories/view.php";
  static String deleteCategories = "$server/categories/delete.php";
  static String addCategoriesToBranch = "$server/categories/add_to_branch.php";
  static String removeCategoriesFromBranch =
      "$server/categories/remove_from_branch.php";

//============================ Weight And Size ==============================//
  static String addWeightSize = "$server/weight_size/add.php";
  static String editWeightSize = "$server/weight_size/edit.php";
  static String viewWeightSize = "$server/weight_size/view.php";
  static String deleteWeightSize = "$server/weight_size/delete.php";

//============================ Coupon ==============================//
  static String addCoupon = "$server/coupon/add.php";
  static String editCoupon = "$server/coupon/edit.php";
  static String viewCoupon = "$server/coupon/view.php";
  static String deleteCoupon = "$server/coupon/delete.php";

//============================ Users ==============================//
  static String getUserPoint = "$server/users/view_point.php";
  static String changeUserState = "$server/users/change_user_state.php";
  static String sendUserNotification = "$server/users/send_notification.php";
  static String viewUsers = "$server/users/view.php";
  static String deleteUsers = "$server/users/delete.php";
  static String addUserPoint = "$server/users/add_point.php";

//============================ Coupon ==============================//
  static String addOffersImage = "$server/image_offers/add.php";
  static String editOffers = "$server/image_offers/edit.php";
  static String editOffersWithImage =
      "$server/image_offers/edit_with_image.php";
  static String viewOffersImage = "$server/image_offers/view.php";
  static String deleteOffersImage = "$server/image_offers/delete.php";
//============================== Notifications ==============================//
  static String sendNotifications = "$server/notifications/send.php";
  static String viewNotifications = "$server/notifications/view.php";
  static String deleteNotifications = "$server/notifications/delete.php";
//============================== Items ==============================//
  static String addItem = "$server/items/add.php";
  static String editItem = "$server/items/edit.php";
  static String editWithImageItem = "$server/items/edit_with_image.php";
  static String viewItem = "$server/items/view.php";
  static String deleteItem = "$server/items/delete.php";
  static String addItemToBranch = "$server/items/add_to_branch.php";
  static String removeItemFromBranch = "$server/items/remove_from_branch.php";
  static String addItemWeight = "$server/items/add_weight.php";
  static String removeItemWeight = "$server/items/remove_weight.php";
  static String addItemImage = "$server/items/add_image.php";
  static String deleteItemImage = "$server/items/delete_image.php";
  static String viewSubItems = "$server/items/view_sub_item.php";
}
