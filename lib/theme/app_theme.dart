import 'package:flutter/material.dart';

abstract final class AppColors {
  static const wineTop = Color(0xFF4B2433);
  static const wineBottom = Color(0xFF2B0A18);
  static const berry = Color(0xFF8E2B52);

  static const panel = Color(0xFFEDEAEE);
  static const field = Color(0xFFF8F7F9);

  static const ink = Color(0xFF1F1B22);
  static const inkSoft = Color(0xFF6F6A72);
}

ThemeData buildAppTheme() {
  final colors = ColorScheme.fromSeed(
    seedColor: AppColors.berry,
    primary: AppColors.berry,
  );

  OutlineInputBorder border([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: color == null
          ? BorderSide.none
          : BorderSide(color: color, width: 1.4),
    );
  }

  return ThemeData(
    colorScheme: colors,
    scaffoldBackgroundColor: AppColors.wineBottom,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.berry,
      selectionColor: AppColors.berry.withValues(alpha: 0.25),
      selectionHandleColor: AppColors.berry,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.field,
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.inkSoft),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: border(),
      enabledBorder: border(),
      focusedBorder: border(AppColors.berry),
      errorBorder: border(colors.error),
      focusedErrorBorder: border(colors.error),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.berry,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.berry.withValues(alpha: 0.6),
        disabledForegroundColor: Colors.white,
        minimumSize: const Size.fromHeight(56),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
