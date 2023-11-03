import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../enum/search_enum.dart';

class HandlingDataSearch extends StatelessWidget {
  final SearchState searchState;
  final Widget child;
  final Widget resultWidget;

  const HandlingDataSearch(
      {super.key,
      required this.searchState,
      required this.child,
      required this.resultWidget});

  @override
  Widget build(BuildContext context) {
    return searchState == SearchState.none
        ? child
        : searchState == SearchState.initial
            ? Container()
            : searchState == SearchState.loading
                ? const Center(child: CircularProgressIndicator())
                : searchState == SearchState.noResult
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(Assets.lottieNoData,
                                height: 250, width: 250, repeat: false),
                            Text("statusFailed".tr,
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ],
                        ),
                      )
                    : resultWidget;
  }
}
