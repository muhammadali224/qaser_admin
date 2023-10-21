import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';

class BranchesHome extends StatelessWidget {
  const BranchesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        CurvedHeader(
          title: 'branches',
          background: AppColor.red,
          widget: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 30,
            crossAxisSpacing: 40,
            children: [
              ItemDashBoard(
                  title: 'add', icon: Icons.add, background: AppColor.red),
              ItemDashBoard(
                  title: 'add', icon: Icons.add, background: AppColor.red),
              ItemDashBoard(
                  title: 'add', icon: Icons.add, background: AppColor.red),
              ItemDashBoard(
                  title: 'add', icon: Icons.add, background: AppColor.red),
              ItemDashBoard(
                  title: 'add', icon: Icons.add, background: AppColor.red),
            ],
          ),
        )
      ],
    );
  }
}
