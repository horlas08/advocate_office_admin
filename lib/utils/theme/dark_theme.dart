import 'package:flutter/material.dart';
import '../app_colors.dart';

class DarkThemeThemes {
  static ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkAppbar,
      iconTheme: IconThemeData(color: AppColors.darkWhiteColor),
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.darkWhiteColor, fontSize: 23),
    ),

    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextBlack),
      displayMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextGray),
      displaySmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkWhiteColor),
      bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextBlack), // Regular text
      bodyMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors
              .darkWhiteColor), // Normal text  , Used to Table Title Color
      bodySmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextGray),
      labelLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextBlack),
      labelMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextGray),
      labelSmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkWhiteColor),
      titleLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor), // Dashboard Cards Text
      titleMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextGray), // TextField Hint Text
      titleSmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkWhiteColor),
      headlineLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextBlue), // Graph Color
      headlineMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.darkWhiteColor), // Graph Color
      headlineSmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextGray), // Dashboard Status Card
    ),

    chipTheme: ChipThemeData(
      backgroundColor: Colors.transparent,
      color: WidgetStateProperty.all(AppColors.darkBackground),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.darkCardColor),
          borderRadius: BorderRadius.circular(8)),
      iconTheme: IconThemeData(color: AppColors.darkWhiteColor),
    ),
    iconTheme: const IconThemeData(
      size: 20,
      color: AppColors.darkIconColor,
      opticalSize: 15,
      applyTextScaling: true,
      fill: .5,
      grade: .5,
      opacity: 1,
      weight: .5,
    ),

    focusColor:
        AppColors.darkBackground, // Focus color for interactive elements
    scaffoldBackgroundColor: AppColors.darkBackground, // Scaffold background
    primaryColor:
        AppColors.darkPrimary, // Primary color used throughout the app
    canvasColor: AppColors.darkWhiteColor, // Canvas background color
    cardColor: AppColors.darkCardColor, // Card background color
    cardTheme:
        const CardThemeData(color: AppColors.darkCardColor), // Card theme settings
    drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.darkBackground), // Drawer background color
  );
}
