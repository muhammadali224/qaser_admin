import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedHeader extends StatelessWidget {
  final String title;
  final Color background;

  const CurvedHeader({
    super.key,
    required this.title,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: background,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
              child: ListTile(
                title: Text(
                  title.tr,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
                leading: const DrawerButton(
                  style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll<Color>(Colors.white),
                      iconSize: MaterialStatePropertyAll<double>(35)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
