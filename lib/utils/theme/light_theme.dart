import 'package:flutter/material.dart';

import '../app_colors.dart';

class LightThemes {
  static ThemeData light = ThemeData(
    /// Appbar Theme Data
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appbar, // AppBar background
      iconTheme: IconThemeData(color: AppColors.background2), // AppBar icons color
      centerTitle: true, // Center title in AppBar
      titleTextStyle: TextStyle(color: AppColors.whiteColor, fontSize: 23), // Title text style
    ),

    /// App Text Theme Data
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textBlack1),
      displayMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textGray1),
      displaySmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textWhite1),
      bodyLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.textBlack1), // Regular text
      bodyMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.textWhite1), // Normal text  , Used to Table Title Color
      bodySmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textGray1),
      labelLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textBlack1),
      labelMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textGray1),
      labelSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textWhite1),
      titleLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.whiteColor),
      titleMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textGray1), // TextField Hint Text
      titleSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textWhite1),
      headlineLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.darkTextBlue),
      headlineMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.darkTextBlue),    // Graph Color
      headlineSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.primary1 ),   // Dashboard Status Card
    ),

    chipTheme: ChipThemeData(
      backgroundColor: Colors.transparent,
      color: WidgetStateProperty.all(AppColors.background1),
      shape: RoundedRectangleBorder(side: BorderSide(color: AppColors.cardColor), borderRadius: BorderRadius.circular(8)),
      iconTheme: IconThemeData(color: AppColors.darkTextBlue),
    ),


    iconTheme: const IconThemeData(
      size: 20,
      color: AppColors.iconColor, // Icon color
      opticalSize: 15,
      applyTextScaling: true,
      fill: .5,
      grade: .5,
      opacity: 1,
      weight: .5,
    ),

    /// App Others Theme Data
    focusColor: AppColors.background1,// Focus color for interactive elements
    scaffoldBackgroundColor: AppColors.background1, // Scaffold background
    primaryColor: AppColors.primary1, // Primary color used throughout the app
    canvasColor: AppColors.whiteColor, // Canvas background color

    cardColor: AppColors.cardColor, // Card background color
    //splashColor: AppColors.primaryGray1, // Splash color on touch events

    cardTheme: const CardThemeData(color: AppColors.cardColor), // Card theme settings
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.background2), // Drawer background color


  );
}
