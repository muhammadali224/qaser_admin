import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FAB extends StatelessWidget {
  final void Function() onTap;
  final IconData? iconData;
  final Color? iconColor;

  const FAB({super.key, required this.onTap, this.iconData, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: onTap,
      child: Icon(
        iconData ?? FontAwesome.plus,
        color: iconColor ?? Colors.white,
        size: 40,
      ),
    );
  }
}
