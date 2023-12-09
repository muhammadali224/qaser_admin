import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ItemDashBoard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subWidget;
  final String imageUrl;

  final void Function()? onTap;

  const ItemDashBoard(
      {super.key,
      required this.title,
      required this.imageUrl,
      this.onTap,
      this.subtitle,
      this.subWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 15,
        color: Colors.white,
        borderOnForeground: true,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder: (_, val, download) =>
                        const Center(child: CircularProgressIndicator()),
                    imageBuilder: (_, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: AutoSizeText(
                        title,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  if (subtitle != null)
                    Expanded(
                      child: Text(subtitle!.tr,
                          style: TextStyle(
                              color: AppColor.marron,
                              fontWeight: FontWeight.bold)),
                    ),
                ],
              ),
            )
          ],
        ),
      ),

      // Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(15),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: const Offset(0, 5),
      //         color: Colors.grey.withOpacity(0.5),
      //         spreadRadius: 3,
      //         blurRadius: 5,
      //       ),
      //     ],
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //           decoration: const BoxDecoration(shape: BoxShape.circle),
      //           child: CircularNetworkImages(imageUrl: imageUrl)),
      //       const SizedBox(height: 10),
      //       Expanded(
      //         child: Container(
      //           // padding: EdgeInsets.symmetric(horizontal: 5),
      //           child: Center(
      //             child: Text(title.tr,
      //                 style: Theme.of(context).textTheme.titleMedium),
      //           ),
      //         ),
      //       ),
      //       if (subtitle != null)
      //         Expanded(
      //           child: Text(subtitle!.tr,
      //               style: Theme.of(context).textTheme.titleSmall),
      //         ),
      //       if (subWidget != null) subWidget!,
      //     ],
      //   ),
      // ),
    );
  }
}
