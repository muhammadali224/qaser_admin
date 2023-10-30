import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/categories_controller/view_categories_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/fab.dart';
import '../../widget/shred_component/item_dashboard.dart';
import '../../widget/shred_component/popup_edit_delete.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCategoriesController controller = Get.put(ViewCategoriesController());
    return Scaffold(
      floatingActionButton: FAB(
        onTap: controller.goToAddCategory,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getCategories(),
        child: Column(
          children: [
            const CurvedHeader(title: 'categories', background: Colors.green),
            Expanded(
              child:
                  GetBuilder<ViewCategoriesController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 30,
                    children: [
                      ...List.generate(
                        controller.categoriesList.length,
                        (index) => Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            ItemDashBoard(
                                onTap: () => controller.goToViewItems(
                                    controller.categoriesList[index]),
                                title: controller
                                    .categoriesList[index].categoriesNameAr!,
                                imageUrl:
                                    "${AppLink.imagesCategories}${controller.categoriesList[index].categoriesImage}",
                                background: Colors.amber),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: PopMenuEditDelete(
                                  onEditTap: () => controller.goToEditCategory(
                                      controller.categoriesList[index]),
                                  onDeleteTap: () => controller.deleteCategory(
                                      controller.categoriesList[index]
                                          .categoriesId!)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
