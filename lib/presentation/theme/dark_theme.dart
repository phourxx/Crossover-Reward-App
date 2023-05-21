import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'common_theme.dart';

final darkTheme = commonTheme.copyWith(
  brightness: Brightness.dark,
  appBarTheme: commonTheme.appBarTheme.copyWith(
    color: AppColors.appBarGray[Brightness.dark],
  ),
  cardColor: AppColors.cardGray[Brightness.dark],
  scaffoldBackgroundColor: AppColors.black,
  dividerColor: AppColors.dividerGray[Brightness.dark],
);
