import 'dart:ui';

import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const AppScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(title, color: AppColors.primary),
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 29.w,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
            child: const SizedBox.shrink(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Divider(
            height: .5.h,
            color: AppColors.appBarDividerGray[Theme.of(context).brightness]!,
          ),
        ),
      ),
      body: body,
    );
  }
}
