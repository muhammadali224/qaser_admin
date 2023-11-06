import 'package:flutter/material.dart';

class UserDetailsSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const UserDetailsSection(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
