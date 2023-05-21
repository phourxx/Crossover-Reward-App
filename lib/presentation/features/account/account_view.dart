import 'package:crossover_reward_app/presentation/shared/app_scaffold.dart';
import 'package:crossover_reward_app/presentation/shared/app_surface_container.dart';
import 'package:crossover_reward_app/presentation/shared/app_text.dart';
import 'package:crossover_reward_app/presentation/theme/app_colors.dart';
import 'package:crossover_reward_app/presentation/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class AccountView extends StatelessWidget {
  static get route => '/account';
  const AccountView({super.key});

  Widget themeLine(BuildContext context, String label, ThemeMode mode) {
    return InkWell(
      onTap: ()=> AppThemeProvider.of(context).themeMode = mode,
      child: AppSurfaceContainer(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(label),
            if(AppThemeProvider.of(context).themeMode == mode)
              Icon(Icons.check_circle, color: AppColors.primary)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Accounts',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSurfaceContainer(child: SizedBox(height: 150.h)),
            Gap(24.h),
            const AppText("App Theme", weight: FontWeight.w700),
            Gap(16.h),
            themeLine(context, 'System', ThemeMode.system),
            Gap(8.h),
            themeLine(context, 'Light', ThemeMode.light),
            Gap(8.h),
            themeLine(context, 'Dark', ThemeMode.dark),
          ],
        ),
      ),
    );
  }
}
