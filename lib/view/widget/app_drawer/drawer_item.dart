import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final void Function() onTap;

  const DrawerItem(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title.tr,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!.tr,
              style: Theme.of(context).textTheme.displayMedium,
            )
          : null,
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
