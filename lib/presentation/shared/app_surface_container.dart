import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSurfaceContainer extends StatelessWidget {
  final Widget child;
  final bool showTopRadius;
  final bool showBottomRadius;
  final bool showVerticalPadding;
  final bool showHorizontalPadding;
  final EdgeInsets? padding;

  const AppSurfaceContainer({
    super.key,
    required this.child,
    this.showTopRadius = true,
    this.showBottomRadius = true,
    this.showVerticalPadding = true,
    this.showHorizontalPadding = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: showHorizontalPadding ? 12.w : 0,
        vertical: showVerticalPadding ? 12.h : 0,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: showTopRadius ? Radius.circular(12.r) : Radius.zero,
            topRight: showTopRadius ? Radius.circular(12.r) : Radius.zero,
            bottomRight: showBottomRadius ? Radius.circular(12.r) : Radius.zero,
            bottomLeft: showBottomRadius ? Radius.circular(12.r) : Radius.zero,
          )
        ),
      ),
      child: child,
    );
  }
}
