import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/categories_controller/view_categories_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/get_branch_name.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCategoriesController controller = Get.put(ViewCategoriesController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: controller.goToAddCashUser,
        onPressed: () {},
        label: Text("addCategories".tr),
        icon: const Icon(FontAwesome.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          CurvedHeader(
            title: 'categories',
            background: Colors.green,
            widget: GetBuilder<ViewCategoriesController>(builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 40,
                  children: [
                    ...List.generate(
                        controller.categoriesList.length,
                        (index) => ItemDashBoard(
                              // onTap: controller.goToView,
                              title: controller
                                  .categoriesList[index].categoriesNameAr!,
                              imageUrl:
                                  "${AppLink.imagesCategories}${controller.categoriesList[index].categoriesImage}",
                              background: Colors.amber,
                              subtitle: getBranchName(
                                  controller.categoriesList[index].branchId!)!,
                            ))
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
