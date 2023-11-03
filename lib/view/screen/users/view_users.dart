import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/users_controller/view_users_controller.dart';
import '../../../core/class/handling_data_search.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';
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
            const CurvedHeader(
              title: 'users',
              background: Colors.blue,
              trailing: SortPopUpMenu(),
            ),
            Expanded(
              child: GetBuilder<UsersViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextField(
                          onChanged: controller.searchUser,
                          controller: controller.searchText,
                          decoration: InputDecoration(
                            hintText:
                                "ابحث بواسطة الاسم, الهاتف, البريد الالكتروني",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1.2),
                            ),
                            suffixIcon: const Icon(Bootstrap.search,
                                color: Colors.green),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1.2),
                            ),
                          ),
                        ),
                      ),
                      HandlingDataSearch(
                        searchState: controller.searchState,
                        resultWidget: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.listSearchResult.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      child: ListTile(
                                        onTap: () => controller.goToUserDetails(
                                            controller.listSearchResult[index]),
                                        title: Text(controller
                                            .listSearchResult[index]
                                            .usersName!),
                                        subtitle: Text(controller
                                            .listSearchResult[index]
                                            .usersPhone!),
                                        // subWidget: Text(
                                        //     controller.listSearchResult[index]
                                        //                 .usersApprove ==
                                        //             0
                                        //         ? "غير مفعل"
                                        //         : "مفعل",
                                        //     style: TextStyle(
                                        //         color: controller
                                        //                     .listSearchResult[
                                        //                         index]
                                        //                     .usersApprove ==
                                        //                 0
                                        //             ? Colors.red
                                        //             : Colors.green,
                                        //         fontWeight: FontWeight.bold)),
                                        // imageUrl:
                                        //     "${AppLink.imageUserProfile}${controller.listSearchResult[index].usersImage}",
                                      ),
                                    ))),
                        child: Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 30,
                            children: [
                              ...List.generate(
                                controller.outputUserList.length,
                                (index) => ItemDashBoard(
                                  onTap: () => controller.goToUserDetails(
                                      controller.outputUserList[index]),
                                  title: controller
                                      .outputUserList[index].usersName!,
                                  subtitle: controller
                                      .outputUserList[index].usersPhone!,
                                  subWidget: Text(
                                      controller.outputUserList[index]
                                                  .usersApprove ==
                                              0
                                          ? "غير مفعل"
                                          : "مفعل",
                                      style: TextStyle(
                                          color: controller
                                                      .outputUserList[index]
                                                      .usersApprove ==
                                                  0
                                              ? Colors.red
                                              : Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  imageUrl:
                                      "${AppLink.imageUserProfile}${controller.outputUserList[index].usersImage}",
                                ),
                              )
                            ],
                          ),
                        ),
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
