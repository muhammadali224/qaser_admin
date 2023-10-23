import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/address/add_address.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/branches/add_branch.dart';
import 'view/screen/branches/branches_home.dart';
import 'view/screen/home/home.dart';

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

  // GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
];
