import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLogo,
      height: 175,
    );
  }
}
