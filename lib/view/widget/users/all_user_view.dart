import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/view_users_controller.dart';
import '../../../core/constant/api_link.dart';
import '../shred_component/item_dashboard.dart';

class AllUserView extends StatelessWidget {
  const AllUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersViewController>(builder: (controller) {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 30,
          children: [
            ...List.generate(
              controller.outputUserList.length,
              (index) => ItemDashBoard(
                onTap: () => controller
                    .goToUserDetails(controller.outputUserList[index]),
                title: controller.outputUserList[index].usersName!,
                subtitle: controller.outputUserList[index].usersPhone!,
                subWidget: Text(
                    controller.outputUserList[index].usersApprove == 0
                        ? "غير مفعل"
                        : "مفعل",
                    style: TextStyle(
                        color:
                            controller.outputUserList[index].usersApprove == 0
                                ? Colors.red
                                : Colors.green,
                        fontWeight: FontWeight.bold)),
                imageUrl:
                    "${AppLink.imageUserProfile}${controller.outputUserList[index].usersImage}",
              ),
            )
          ],
        ),
      );
    });
  }
}
