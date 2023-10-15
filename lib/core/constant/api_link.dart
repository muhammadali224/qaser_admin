class AppLink {
  static const String server = "https://qaser.mhjcode.com/admin/cash_system";
  static const String test = "$server/test.php";

//============================== Images ==============================//
  static const String images = "$server/upload";
  static const String imagesCategories = "$images/categories/";
  static const String imageUserProfile = "$images/user_profile/";
  static const String imageOffer = "$images/offers/";
  static const String imagesItems = "$images/items/";

//=============================== Auth ===============================//
  static const String login = "$server/auth/cash_login.php";
  static const String getUserDetails = "$server/auth/get_user_details.php";

//============================== Home  ==============================//
  static const String homePage = '$server/home.php';

//============================== Items ==============================//
  static const String items = '$server/items/items.php';
  static const String searchItems = '$server/items/search.php';
  static const String offersItems = '$server/items/offers.php';
  static const String subItems = '$server/items/sub_items.php';

//============================ Address ==============================//
  static const String addAddress = '$server/address/add.php';
  static const String deleteAddress = '$server/address/delete.php';
  static const String getAddresses = '$server/address/view.php';
  static const String editAddress = '$server/address/edit.php';

//============================ Orders ==============================//
  static const String checkout = '$server/orders/checkout.php';
  static const String getAllOrders = '$server/orders/get_orders.php';
  static const String orderDetails = '$server/orders/order_details.php';
  static const String orderDelete = '$server/orders/delete.php';
  static const String orderCancel = '$server/orders/cancel.php';
  static const String orderState = '$server/orders/change_order_state.php';

//============================ branch Setting ==============================//
  static const String changeBranchState = '$server/branch/change_state.php';
  static const String getBranchData = '$server/branch/get_branch.php';
}
