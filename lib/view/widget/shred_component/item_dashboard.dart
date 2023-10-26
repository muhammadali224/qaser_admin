import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circular_cached_network_image.dart';

class ItemDashBoard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color background;
  final void Function()? onTap;

  const ItemDashBoard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.background,
      this.onTap,
      required this.subtitle});

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
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background,
              ),
              // child: Icon(icon, color: Colors.white),
              child: CircularNetworkImages(imageUrl: imageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              title.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              subtitle.tr,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
