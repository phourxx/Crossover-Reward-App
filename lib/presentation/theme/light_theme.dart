import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'common_theme.dart';

final lightTheme = commonTheme.copyWith(
  brightness: Brightness.light,
  appBarTheme: commonTheme.appBarTheme.copyWith(
    color: AppColors.appBarGray[Brightness.light],
  ),
  cardColor: AppColors.cardGray[Brightness.light],
  scaffoldBackgroundColor: Colors.white,
  dividerColor: AppColors.dividerGray[Brightness.light],
);
