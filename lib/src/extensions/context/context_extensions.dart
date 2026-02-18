import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Ekran boyutları
  Size get screenSize => MediaQuery.of(this).size;

  /// Ekran yüksekliği
  double get height => screenSize.height;

  /// Ekran genişliği
  double get width => screenSize.width;

  /// Ekran yüksekliğinin oranı
  double screenHeight(double size) => screenSize.height * size;

  /// Ekran genişliğinin oranı
  double scrennWidth(double size) => screenSize.width * size;

  /// Boşluklar
  Divider divider({Color? color}) => Divider(color: color);

  // ── Theme ──

  /// Theme data
  ThemeData get theme => Theme.of(this);

  /// ColorScheme
  ColorScheme get colorScheme => theme.colorScheme;

  // ── ColorScheme Kısaltmaları ──

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get errorColor => colorScheme.error;
  Color get surfaceColor => colorScheme.surface;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get outlineColor => colorScheme.outline;

  // ── TextTheme Kısaltmaları ──

  TextTheme get textTheme => theme.textTheme;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  // ── Widget Theme Kısaltmaları ──

  AppBarThemeData get appBarTheme => theme.appBarTheme;
  CardThemeData get cardTheme => theme.cardTheme;
  InputDecorationThemeData get inputTheme => theme.inputDecorationTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButtonTheme => theme.outlinedButtonTheme;
  BottomNavigationBarThemeData get bottomNavTheme =>
      theme.bottomNavigationBarTheme;
}
