import 'package:flutter/material.dart';
import 'package:tdlist/theme/app_style.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.backPrimary,
      onPrimary: AppColor.backSecondary,
      primaryContainer: AppColor.backElevated,
      secondary: AppColor.labelPrimary,
      onSecondary: AppColor.labelSecondary,
      secondaryContainer: AppColor.labelTertiary,
      onSecondaryContainer: AppColor.labelDisable,
      tertiary: AppColor.supportSeparator,
      onTertiary: AppColor.supportOverlay,
    ),
    textTheme: const TextTheme(
      titleLarge: AppStyle.titleLarge,
      titleMedium: AppStyle.titleMedium,
      titleSmall: AppStyle.titleSmall,
      labelLarge: AppStyle.labelLarge,
      bodyMedium: AppStyle.bodyMedium,
      bodySmall: AppStyle.bodySmall,
      labelMedium: AppStyle.labelMedium,
      labelSmall: AppStyle.labelSmall,
      displayMedium: AppStyle.displayMedium,
      displaySmall: AppStyle.displaySmall,
      headlineMedium: AppStyle.headlineMedium,
      headlineSmall: AppStyle.headlineSmall,
      headlineLarge: AppStyle.headlineLarge,
      displayLarge: AppStyle.displayLarge,
      bodyLarge: AppStyle.bodyLarge,
    ),
    // useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColor.darkBackPrimary,
      onPrimary: AppColor.darkBackSecondary,
      primaryContainer: AppColor.darkBackElevated,
      secondary: AppColor.darkLabelPrimary,
      onSecondary: AppColor.darkLabelSecondary,
      secondaryContainer: AppColor.darkLabelTertiary,
      onSecondaryContainer: AppColor.darkLabelDisable,
      tertiary: AppColor.darkSupportSeparator,
      onTertiary: AppColor.darkSupportOverlay,
    ),
    textTheme: const TextTheme(
      titleLarge: AppStyle.darkTitleLarge,
      titleMedium: AppStyle.darkTitleMedium,
      titleSmall: AppStyle.darkTitleSmall,
      labelLarge: AppStyle.darkLabelLarge,
      bodyMedium: AppStyle.darkBodyMedium,
      bodySmall: AppStyle.darkBodySmall,
      labelMedium: AppStyle.darkLabelMedium,
      labelSmall: AppStyle.darkLabelSmall,
      displayMedium: AppStyle.darkDisplayMedium,
      displaySmall: AppStyle.darkDisplaySmall,
      headlineMedium: AppStyle.darkHeadlineMedium,
      headlineSmall: AppStyle.darkHeadlineSmall,
      headlineLarge: AppStyle.darkHeadlineLarge,
      displayLarge: AppStyle.darkDisplayLarge,
      bodyLarge: AppStyle.darkBodyLarge,
    ), // useMaterial3: true,
  );
}
