import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/view_users_controller.dart';
import '../../../core/class/handling_data_search.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/users/all_user_view.dart';
import '../../widget/users/search_result_widget.dart';
import '../../widget/users/serch_field.dart';
import '../../widget/users/sort_popuo_menu.dart';
import '../app_drawer/app_drawer.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewController controller = Get.put(UsersViewController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getUsers(),
        child: Column(
          children: [
            CurvedHeader(
                title: 'users',
                background: Colors.blue,
                trailing: SortPopUpMenu(
                  optionMenu: controller.optionMenu,
                  onSelected: (val) => controller.selectOptionList(val),
                )),
            Expanded(
              child: GetBuilder<UsersViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SearchUserField(),
                      HandlingDataSearch(
                        searchState: controller.searchState,
                        resultWidget: const SearchResultWidget(),
                        child: const AllUserView(),
                      ),
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
