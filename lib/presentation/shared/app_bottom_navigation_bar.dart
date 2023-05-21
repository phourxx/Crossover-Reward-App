import 'dart:math';
import 'dart:ui';

import 'package:crossover_reward_app/core/extensions/string_extensions.dart';
import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppNavigationItem{
  final String label;
  final String route;

  const AppNavigationItem({
    required this.label,
    required this.route,
  });
}

class AppBottomNavigationBar extends StatelessWidget {
  final List<AppNavigationItem> items;
  const AppBottomNavigationBar({super.key, required this.items});

  Widget icon(bool active, AppNavigationItem item) {
    return SvgPicture.asset(
      '${item.label.replaceAll(' ', '_').toLowerCase()}${active ? '' : '_inactive'}_icon'.svg,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).location;
    final currentIndex = max(
      items.indexWhere((item) => item.route == currentRoute),
      0
    );

    return Container(
      padding: EdgeInsets.only(top: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            width: .5.h,
            color: AppColors.appBarDividerGray[Theme.of(context).brightness]!,
          ),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            iconSize: 26.sp,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            backgroundColor: Colors.transparent,
            unselectedFontSize: 10.sp,
            selectedFontSize: 10.sp,
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              height: 11.93/10,
              fontWeight: FontWeight.w500,
              letterSpacing: -.24.sp,
              color: AppColors.gray,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              height: 11.93/10,
              fontWeight: FontWeight.w500,
              letterSpacing: -.24.sp,
              color: AppColors.primary,
            ),
            elevation: 0,
            items: items.map((item) => BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: icon(items.indexOf(item) == currentIndex, item),
              label: item.label,
            )).toList(),
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.gray,
            onTap: (index){
              if(currentRoute != items[index].route){
                context.push(items[index].route);
              }
            },
          ),
        ),
      ),
    );
  }
}
