import 'package:flutter/material.dart';

class EitherOr extends StatelessWidget {
  final bool showFirst;
  final WidgetBuilder buildFirst;
  final WidgetBuilder buildSecond;

  const EitherOr(
      this.showFirst, {
        super.key,
        required this.buildFirst,
        required this.buildSecond,
      });

  @override
  Widget build(BuildContext context) {
    if (showFirst) {
      return buildFirst(context);
    } else {
      return buildSecond(context);
    }
  }
}
