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
  double screenWidth(double size) => screenSize.width * size;

  /// Ekran genişliğinin oranı
  ///
  /// @deprecated [screenWidth] kullanın.
  @Deprecated('Use screenWidth instead. This was a typo.')
  double scrennWidth(double size) => screenWidth(size);

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

  /// Material 3'te TextTheme alanları nullable olabilir; `TextStyle()` fallback kullanılır.
  TextStyle get displayLarge => textTheme.displayLarge ?? const TextStyle();
  TextStyle get displayMedium => textTheme.displayMedium ?? const TextStyle();
  TextStyle get displaySmall => textTheme.displaySmall ?? const TextStyle();

  TextStyle get headlineLarge => textTheme.headlineLarge ?? const TextStyle();
  TextStyle get headlineMedium => textTheme.headlineMedium ?? const TextStyle();
  TextStyle get headlineSmall => textTheme.headlineSmall ?? const TextStyle();

  TextStyle get titleLarge => textTheme.titleLarge ?? const TextStyle();
  TextStyle get titleMedium => textTheme.titleMedium ?? const TextStyle();
  TextStyle get titleSmall => textTheme.titleSmall ?? const TextStyle();

  TextStyle get bodyLarge => textTheme.bodyLarge ?? const TextStyle();
  TextStyle get bodyMedium => textTheme.bodyMedium ?? const TextStyle();
  TextStyle get bodySmall => textTheme.bodySmall ?? const TextStyle();

  TextStyle get labelLarge => textTheme.labelLarge ?? const TextStyle();
  TextStyle get labelMedium => textTheme.labelMedium ?? const TextStyle();
  TextStyle get labelSmall => textTheme.labelSmall ?? const TextStyle();

  // ── Widget Theme Kısaltmaları ──

  AppBarThemeData get appBarTheme => theme.appBarTheme;
  CardThemeData get cardTheme => theme.cardTheme;
  InputDecorationThemeData get inputTheme => theme.inputDecorationTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButtonTheme => theme.outlinedButtonTheme;
  BottomNavigationBarThemeData get bottomNavTheme =>
      theme.bottomNavigationBarTheme;
}
