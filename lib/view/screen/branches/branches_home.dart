import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../widget/shred_component/app_drawer.dart';
import '../../widget/shred_component/curved_header.dart';
import '../../widget/shred_component/item_dashboard.dart';

class BranchesHome extends StatelessWidget {
  const BranchesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: ListView(
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
              children: const [
                ItemDashBoard(
                    title: 'add', icon: Icons.add, background: Colors.red),
                ItemDashBoard(
                    title: 'edit', icon: Icons.edit, background: Colors.purple),
                ItemDashBoard(
                    title: 'delete',
                    icon: Icons.delete_forever,
                    background: Colors.blue),
              ],
            ),
          )
        ],
      ),
    );
  }
}
