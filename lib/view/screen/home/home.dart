// import 'package:flutter/material.dart';
// import 'package:flutter_side_menu/flutter_side_menu.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/home_controller/home_controller.dart';
// import '../../../generated/assets.dart';
// import '../branches/branches_home.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//
//     return Scaffold(
//       body: SafeArea(
//         child: GetBuilder<HomeController>(builder: (controller) {
//           return Row(
//             children: [
//               SideMenu(
//                 hasResizer: false,
//                 controller: controller.sideController,
//                 backgroundColor: Colors.grey.shade200,
//                 mode: SideMenuMode.auto,
//                 builder: (data) => SideMenuData(
//                   header: Container(
//                     padding: const EdgeInsets.all(5),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(120),
//                       child: Image.asset(
//                         Assets.imagesQaser,
//                         height: 120,
//                         width: 120,
//                       ),
//                     ),
//                   ),
//                   items: [
//                     SideMenuItemDataTile(
//                       onTap: () => controller.changeIndex(0),
//                       title: 'home'.tr,
//                       highlightSelectedColor: Colors.red,
//                       icon: const Icon(Icons.home),
//                       hasSelectedLine: false,
//                       isSelected: controller.currentIndex == 0,
//                     ),
//                     SideMenuItemDataTile(
//                       onTap: () => controller.changeIndex(1),
//                       highlightSelectedColor: Colors.red,
//                       title: 'branches'.tr,
//                       icon: const Icon(Icons.business),
//                       hasSelectedLine: false,
//                       isSelected: controller.currentIndex == 1,
//                     ),
//                     SideMenuItemDataTile(
//                       isSelected: controller.currentIndex == 2,
//                       onTap: () => controller.changeIndex(2),
//                       title: 'Item 3',
//                       hasSelectedLine: false,
//                       icon: const Icon(Icons.play_arrow),
//                     ),
//                     SideMenuItemDataTile(
//                       isSelected: controller.currentIndex == 3,
//                       onTap: () => controller.changeIndex(3),
//                       title: 'Item 4',
//                       hasSelectedLine: false,
//                       icon: const Icon(Icons.car_crash),
//                     ),
//                   ],
//                   footer: const Text('Footer'),
//                 ),
//               ),
//               Expanded(
//                 child: PageView(
//                   physics: const NeverScrollableScrollPhysics(),
//                   controller: controller.pageController,
//                   children: [
//                     Container(
//                       color: Colors.white,
//                       child: const Center(
//                         child: Text(
//                           'body 1',
//                         ),
//                       ),
//                     ),
//                     const BranchesHome(),
//                     Container(
//                       color: Colors.white,
//                       child: const Center(
//                         child: Text(
//                           'body 3',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.white,
//                       child: const Center(
//                         child: Text(
//                           'body 4',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../generated/assets.dart';
import '../branches/branches_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SideMenu(
              // Page controller to manage a PageView
              controller: controller.sideMenu,
              // Will shows on top of all items, it can be a logo or a Title text
              title: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.asset(
                  Assets.imagesQaser,
                  height: 120,
                  width: 120,
                ),
              ),
              // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
              footer: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              // Notify when display mode changed
              onDisplayModeChanged: (mode) {
                print(mode);
              },
              // List of SideMenuItem to show them on SideMenu
              items: [
                SideMenuItem(
                  title: 'Dashboard',
                  onTap: (index, _) {
                    controller.sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.home),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SideMenuItem(
                  title: 'Settings',
                  onTap: (index, _) {
                    controller.sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.settings),
                ),
                const SideMenuItem(
                  title: 'Exit',
                  icon: Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Center(
                    child: Text('Dashboard'),
                  ),
                  BranchesHome(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
