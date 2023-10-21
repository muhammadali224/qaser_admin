import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // final sideController = SideMenuController();
  SideMenuController sideMenu = SideMenuController();
  PageController pageController = PageController();
  //
  // int currentIndex = 0;
  //
  // changeIndex(int index) {
  //   currentIndex = index;
  //   pageController.animateToPage(index,
  //       duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
  //   update();
  // }

  @override
  void onInit() {
    sideMenu.addListener((index) {
      pageController.animateToPage(index,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
    });
    super.onInit();
  }
}
