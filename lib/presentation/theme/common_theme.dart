import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

final commonTheme = ThemeData(
  primaryColor: AppColors.primary,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 34.sp,
      height: 40/34,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      height: 23.87/20,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 11.sp,
      height: 13.13/11,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.sp,
      height: 15.51/13,
    ),
    bodyLarge: TextStyle(
      fontSize: 15.sp,
      height: 17.9/15,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 17.sp,
      height: 20.29/17,
    ),
    centerTitle: true,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
);