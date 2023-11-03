import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularNetworkImages extends StatelessWidget {
  final String imageUrl;

  const CircularNetworkImages({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: 45,
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(
        Icons.warning_amber_rounded,
        size: 45,
      ),
    );
  }
}
