import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/view_users_controller.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersViewController>(builder: (controller) {
      return Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listSearchResult.length,
              itemBuilder: (BuildContext context, int index) => Container(
                    padding: const EdgeInsets.all(15),
                    child: ListTile(
                      onTap: () => controller
                          .goToUserDetails(controller.listSearchResult[index]),
                      title:
                          Text(controller.listSearchResult[index].usersName!),
                      subtitle:
                          Text(controller.listSearchResult[index].usersPhone!),
                    ),
                  )));
    });
  }
}
