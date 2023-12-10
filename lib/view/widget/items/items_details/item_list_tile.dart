import 'package:flutter/material.dart';

class ItemDetailsListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? iconData;
  final Color? color;
  final void Function()? onTap;

  const ItemDetailsListTile(
      {super.key,
      required this.title,
      this.subtitle,
      this.iconData,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: Colors.red.withOpacity(0.2),
      title: Text(title),
      subtitle: Text(subtitle ?? ""),
      trailing: Icon(
        iconData ?? Icons.remove_circle,
        color: color ?? Colors.red,
      ),
    );
  }
}
