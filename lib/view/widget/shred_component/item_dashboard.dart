import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDashBoard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color background;
  final void Function()? onTap;

  const ItemDashBoard(
      {super.key,
      required this.title,
      required this.icon,
      required this.background,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              // color: Theme.of(context).primaryColor.withOpacity(0.2),
              color: background.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              title.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
