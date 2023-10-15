import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersTabStatus extends StatelessWidget {
  final String title;
  final IconData icon;

  const OrdersTabStatus({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
      text: title.tr,
    );
  }
}
