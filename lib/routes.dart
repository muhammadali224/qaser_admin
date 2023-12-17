import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/address/add_address.dart';
import 'view/screen/admin_user/add_edit_admin_user.dart';
import 'view/screen/admin_user/view_admin_user.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/branches/add_branch.dart';
import 'view/screen/branches/branches_home.dart';
import 'view/screen/cash_user/add_edit_cash_user.dart';
import 'view/screen/cash_user/view_cash_user.dart';
import 'view/screen/categories/add_edit_categories.dart';
import 'view/screen/categories/view_categories.dart';
import 'view/screen/coupon/add_edit_copun.dart';
import 'view/screen/coupon/view_coupon.dart';
import 'view/screen/home/home.dart';
import 'view/screen/image_offer/edit_imags.dart';
import 'view/screen/image_offer/view_images.dart';
import 'view/screen/items/add_edit_items.dart';
import 'view/screen/items/item_details.dart';
import 'view/screen/items/view_items.dart';
import 'view/screen/notification/view_notification.dart';
import 'view/screen/users/user_details.dart';
import 'view/screen/users/view_users.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Login(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
    binding: InitBindings(),
  ),
  GetPage(name: AppRoutes.home, page: () => const HomePage()),
  GetPage(name: AppRoutes.branches, page: () => const BranchesHome()),
  GetPage(name: AppRoutes.addBranch, page: () => const AddBranch()),
  GetPage(name: AppRoutes.editBranch, page: () => const AddBranch()),
  GetPage(name: AppRoutes.addAddress, page: () => const AddressAdd()),
  GetPage(name: AppRoutes.adminUser, page: () => const ViewAdminUser()),
  GetPage(name: AppRoutes.addAdminUser, page: () => const AddEditAdminUser()),
  GetPage(name: AppRoutes.editAdminUser, page: () => const AddEditAdminUser()),
  GetPage(name: AppRoutes.cashUser, page: () => const ViewCashUser()),
  GetPage(name: AppRoutes.addCashUser, page: () => const AddEditCashUser()),
  GetPage(name: AppRoutes.editCashUser, page: () => const AddEditCashUser()),
  GetPage(name: AppRoutes.viewCategories, page: () => const ViewCategories()),
  GetPage(name: AppRoutes.addCategory, page: () => const AddEditCategories()),
  GetPage(name: AppRoutes.editCategory, page: () => const AddEditCategories()),
  GetPage(name: AppRoutes.viewItems, page: () => const ViewItems()),
  GetPage(name: AppRoutes.addItems, page: () => const AddEditItems()),
  GetPage(name: AppRoutes.editItems, page: () => const AddEditItems()),
  GetPage(name: AppRoutes.itemDetails, page: () => const ItemDetails()),
  GetPage(name: AppRoutes.viewCoupon, page: () => const ViewCoupon()),
  GetPage(name: AppRoutes.editCoupon, page: () => const AddEditCoupon()),
  GetPage(name: AppRoutes.addCoupon, page: () => const AddEditCoupon()),
  GetPage(name: AppRoutes.viewOffersImage, page: () => const ViewImageOffer()),
  GetPage(name: AppRoutes.editOffersImage, page: () => const EditImagesOffer()),
  GetPage(name: AppRoutes.addOffersImage, page: () => const EditImagesOffer()),
  GetPage(name: AppRoutes.usersView, page: () => const ViewUsers()),
  GetPage(name: AppRoutes.userDetails, page: () => const UserDetails()),
  GetPage(
      name: AppRoutes.viewNotification, page: () => const ViewNotification()),
];
