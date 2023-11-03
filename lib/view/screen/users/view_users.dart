import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/view_users_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/api_link.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';
import '../app_drawer/app_drawer.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewController controller = Get.put(UsersViewController());
    return Scaffold(
      // floatingActionButton: FAB(
      //   onTap: controller.goToAddCategory,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.getUsers(),
        child: Column(
          children: [
            const CurvedHeader(
              title: 'users',
              background: Colors.blue,
              trailing: Icon(Icons.sort),
            ),
            Expanded(
              child: GetBuilder<UsersViewController>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () => controller.sortList(),
                          child: Text("null"),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 30,
                          children: [
                            ...List.generate(
                              controller.usersList.length,
                              (index) => ItemDashBoard(
                                onTap: () => controller.goToUserDetails(
                                    controller.usersList[index]),
                                title: controller.usersList[index].usersName!,
                                subtitle:
                                    controller.usersList[index].usersPhone!,
                                subWidget: Text(
                                    controller.usersList[index].usersApprove ==
                                            0
                                        ? "غير مفعل"
                                        : "مفعل",
                                    style: TextStyle(
                                        color: controller.usersList[index]
                                                    .usersApprove ==
                                                0
                                            ? Colors.red
                                            : Colors.green,
                                        fontWeight: FontWeight.bold)),
                                imageUrl:
                                    "${AppLink.imageUserProfile}${controller.usersList[index].usersImage}",
                              ),
                            )
                          ],
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
