import 'package:flutter/material.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

//Main Theme
final mainTheme = ThemeData(
  fontFamily: "sans",
  useMaterial3: true,
  primaryColor: AppColors.primary,
  textTheme: const TextTheme(
          displayLarge: AppTypography.h1,
          displayMedium: AppTypography.h2,
          displaySmall: AppTypography.h3,
          headlineMedium: AppTypography.h4,
          headlineSmall: AppTypography.h5,
          titleLarge: AppTypography.h6,
          titleMedium: AppTypography.subtitle1,
          titleSmall: AppTypography.subtitle2,
          bodyLarge: AppTypography.body1,
          bodyMedium: AppTypography.body2,
          bodySmall: AppTypography.caption,
          labelSmall: AppTypography.overline,
          labelMedium: AppTypography.labelMedium,
          labelLarge: AppTypography.labelLarge)
      .apply(bodyColor: AppColors.gray800, displayColor: AppColors.gray800),
);
