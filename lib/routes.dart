import 'package:get/get.dart';
import 'package:qaser_admin/view/screen/branches/view_branches.dart';

import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
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
  GetPage(name: AppRoutes.viewBranches, page: () => const ViewBranches()),
  GetPage(name: AppRoutes.addBranch, page: () => const AddBranch()),

  // GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
];
