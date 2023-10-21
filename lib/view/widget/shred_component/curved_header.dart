import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedHeader extends StatelessWidget {
  final String title;
  final Color background;
  final Widget widget;

  const CurvedHeader(
      {super.key,
      required this.title,
      required this.background,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              color: background,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    title.tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: background,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100))),
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
}
