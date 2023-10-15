import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/home/search_result.dart';
import 'view/screen/orders/orders.dart';
import 'view/screen/orders/orders_details.dart';
import 'view/screen/printers/printers.dart';
import 'view/screen/setting/setting_screen/settings.dart';

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
  GetPage(name: AppRoutes.orders, page: () => const Orders()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.appSettings, page: () => const AppSettings()),
  GetPage(name: AppRoutes.searchResult, page: () => const SearchListResult()),
  GetPage(name: AppRoutes.printers, page: () => const Printers()),
];
