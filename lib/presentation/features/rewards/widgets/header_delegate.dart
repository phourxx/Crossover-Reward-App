import 'dart:ui';

import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {

  final int kHeaderExpandedHeight = 140;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final offset = (shrinkOffset > maxExtent
        ? maxExtent
        : shrinkOffset) /
        maxExtent;
    final textStyle = Theme.of(context).textTheme.titleLarge!;
    return Container(
      padding: EdgeInsets.only(
        left: 16.w, right: 16.w,
        bottom: 1.h, top: ScreenUtil().statusBarHeight,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor!.withOpacity(offset),
        border: Border(
          bottom: offset == 1 ? BorderSide(
            width: .5.h,
            color: AppColors.appBarDividerGray[Theme.of(context).brightness]!,
          ) : BorderSide.none,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(),
          child: Align(
            alignment: Alignment(offset - 1, 1 - offset),
            child: AppText(
              'Rewards',
              size: lerpDouble(textStyle.fontSize, 17.sp, offset),
              weight: FontWeight.lerp(textStyle.fontWeight, FontWeight.w600, offset),
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => (kHeaderExpandedHeight - kToolbarHeight + ScreenUtil().statusBarHeight).h;

  @override
  double get minExtent => kToolbarHeight + ScreenUtil().statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
