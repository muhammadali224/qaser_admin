import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Login(), middlewares: [
    MyMiddleWare(),
  ]),

  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
    binding: InitBindings(),
  ),

  // GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
];
