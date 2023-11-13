import 'package:flutter/material.dart';

class HomeBranchTitle extends StatelessWidget {
  final String title;
  const HomeBranchTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Divider(),
        )),
        Center(
            child: Text(
          title,
          style: const TextStyle(fontSize: 22, color: Colors.black),
        )),
        const Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Divider(),
            )),
      ],
    );
  }
}
