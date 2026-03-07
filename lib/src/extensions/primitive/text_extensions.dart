import 'package:flutter/material.dart';

/// Chainable Text builder.
///
/// Kullanım:
/// ```dart
/// "Hello".text.bold.headline4(context).color(Colors.red)
/// ```
///
/// Allocation optimizasyonu:
/// Eski tasarımda her zincir adımı hem yeni bir TextBuilder hem de
/// yeni bir TextStyle.copyWith() çağrısı yapıyordu (2N nesne).
/// Yeni tasarımda stil özellikleri ayrı alanlarda biriktirilir;
/// TextStyle yalnızca build() anında bir kez yaratılır (N TextBuilder + 1 TextStyle).
class TextBuilder extends StatelessWidget {
  final String _text;
  final TextAlign? _textAlign;
  final int? _maxLines;
  final TextOverflow? _overflow;

  /// Dışarıdan verilen veya stil birleştirmesinden oluşan temel stil.
  /// Bireysel özellikler bu stil üzerine build() sırasında uygulanır.
  final TextStyle _baseStyle;

  // ── Zincir adımlarında biriken stil özellikleri ──────────────────────────
  // Her adımda TextStyle.copyWith() çağrılmaz; sadece bu alanlar güncellenir.
  // Gerçek TextStyle nesnesi yalnızca _buildEffectiveStyle() içinde yaratılır.
  final FontWeight? _fontWeight;
  final FontStyle? _fontStyle;
  final TextDecoration? _textDecoration;
  final Color? _color;
  final Color? _backgroundColor;
  final double? _fontSize;
  final double? _letterSpacing;
  final double? _wordSpacing;
  final double? _lineHeight;
  final String? _fontFamily;

  // ── Public constructor — mevcut API değişmez ─────────────────────────────
  const TextBuilder(
    this._text, {
    super.key,
    TextStyle style = const TextStyle(),
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) : _baseStyle = style,
       _textAlign = textAlign,
       _maxLines = maxLines,
       _overflow = overflow,
       _fontWeight = null,
       _fontStyle = null,
       _textDecoration = null,
       _color = null,
       _backgroundColor = null,
       _fontSize = null,
       _letterSpacing = null,
       _wordSpacing = null,
       _lineHeight = null,
       _fontFamily = null;

  /// Zincir adımları için dahili constructor.
  /// Her çağrı yalnızca bir TextBuilder nesnesi yaratır; TextStyle yaratılmaz.
  const TextBuilder._chain(
    this._text, {
    TextStyle baseStyle = const TextStyle(),
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    double? lineHeight,
    String? fontFamily,
  }) : _baseStyle = baseStyle,
       _textAlign = textAlign,
       _maxLines = maxLines,
       _overflow = overflow,
       _fontWeight = fontWeight,
       _fontStyle = fontStyle,
       _textDecoration = textDecoration,
       _color = color,
       _backgroundColor = backgroundColor,
       _fontSize = fontSize,
       _letterSpacing = letterSpacing,
       _wordSpacing = wordSpacing,
       _lineHeight = lineHeight,
       _fontFamily = fontFamily;

  /// Bireysel stil özelliklerini güncelleyerek yeni bir TextBuilder döner.
  /// _baseStyle dokunulmadan aktarılır; TextStyle materyalizasyonu ertelenir.
  TextBuilder _copyWith({
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    double? lineHeight,
    String? fontFamily,
  }) {
    return TextBuilder._chain(
      _text,
      baseStyle: _baseStyle,
      textAlign: textAlign ?? _textAlign,
      maxLines: maxLines ?? _maxLines,
      overflow: overflow ?? _overflow,
      fontWeight: fontWeight ?? _fontWeight,
      fontStyle: fontStyle ?? _fontStyle,
      textDecoration: textDecoration ?? _textDecoration,
      color: color ?? _color,
      backgroundColor: backgroundColor ?? _backgroundColor,
      fontSize: fontSize ?? _fontSize,
      letterSpacing: letterSpacing ?? _letterSpacing,
      wordSpacing: wordSpacing ?? _wordSpacing,
      lineHeight: lineHeight ?? _lineHeight,
      fontFamily: fontFamily ?? _fontFamily,
    );
  }

  /// Biriktirilmiş stil özelliklerini tek bir TextStyle nesnesine dönüştürür.
  /// Hiç özellik değişmediyse _baseStyle'ı doğrudan döndürür (ekstra allocation yok).
  /// Sadece build() veya stil birleştirme sırasında çağrılır.
  TextStyle _buildEffectiveStyle() {
    if (_fontWeight == null &&
        _fontStyle == null &&
        _textDecoration == null &&
        _color == null &&
        _backgroundColor == null &&
        _fontSize == null &&
        _letterSpacing == null &&
        _wordSpacing == null &&
        _lineHeight == null &&
        _fontFamily == null) {
      // Yalnızca base stil varsa yeni nesne yaratmaya gerek yok
      return _baseStyle;
    }
    return _baseStyle.copyWith(
      fontWeight: _fontWeight,
      fontStyle: _fontStyle,
      decoration: _textDecoration,
      color: _color,
      backgroundColor: _backgroundColor,
      fontSize: _fontSize,
      letterSpacing: _letterSpacing,
      wordSpacing: _wordSpacing,
      height: _lineHeight,
      fontFamily: _fontFamily,
    );
  }

  // ========================================
  // Font Weight
  // ========================================
  TextBuilder get thin => _copyWith(fontWeight: FontWeight.w100);
  TextBuilder get extraLight => _copyWith(fontWeight: FontWeight.w200);
  TextBuilder get light => _copyWith(fontWeight: FontWeight.w300);
  TextBuilder get regular => _copyWith(fontWeight: FontWeight.w400);
  TextBuilder get medium => _copyWith(fontWeight: FontWeight.w500);
  TextBuilder get semiBold => _copyWith(fontWeight: FontWeight.w600);
  TextBuilder get bold => _copyWith(fontWeight: FontWeight.w700);
  TextBuilder get extraBold => _copyWith(fontWeight: FontWeight.w800);
  TextBuilder get black => _copyWith(fontWeight: FontWeight.w900);

  // ========================================
  // Font Style
  // ========================================
  TextBuilder get italic => _copyWith(fontStyle: FontStyle.italic);
  TextBuilder get normal => _copyWith(fontStyle: FontStyle.normal);

  // ========================================
  // Text Decoration
  // ========================================
  TextBuilder get underline =>
      _copyWith(textDecoration: TextDecoration.underline);
  TextBuilder get lineThrough =>
      _copyWith(textDecoration: TextDecoration.lineThrough);
  TextBuilder get overline =>
      _copyWith(textDecoration: TextDecoration.overline);
  TextBuilder get noDecoration =>
      _copyWith(textDecoration: TextDecoration.none);

  // ========================================
  // Text Align
  // ========================================
  TextBuilder get alignLeft => _copyWith(textAlign: TextAlign.left);
  TextBuilder get alignRight => _copyWith(textAlign: TextAlign.right);
  TextBuilder get alignCenter => _copyWith(textAlign: TextAlign.center);
  TextBuilder get alignJustify => _copyWith(textAlign: TextAlign.justify);

  // ========================================
  // Overflow
  // ========================================
  TextBuilder get ellipsis => _copyWith(overflow: TextOverflow.ellipsis);
  TextBuilder get fade => _copyWith(overflow: TextOverflow.fade);
  TextBuilder get clip => _copyWith(overflow: TextOverflow.clip);
  TextBuilder get visible => _copyWith(overflow: TextOverflow.visible);

  // ========================================
  // Typography Styles (Theme Based)
  // ========================================

  /// Tema stilini, biriktirilmiş özelliklerle birleştirir.
  /// Birleşim sonrası bireysel özellikler baseStyle'a dahil edilir ve sıfırlanır.
  TextBuilder _mergeThemeStyle(TextStyle? themeStyle) {
    final effective = _buildEffectiveStyle();
    final merged = themeStyle?.merge(effective) ?? effective;
    return TextBuilder._chain(
      _text,
      baseStyle: merged,
      textAlign: _textAlign,
      maxLines: _maxLines,
      overflow: _overflow,
      // Bireysel özellikler artık merged içinde; yeniden atanmaz (null kalır)
    );
  }

  TextBuilder displayLarge(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.displayLarge);
  TextBuilder displayMedium(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.displayMedium);
  TextBuilder displaySmall(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.displaySmall);

  TextBuilder headlineLarge(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.headlineLarge);
  TextBuilder headlineMedium(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.headlineMedium);
  TextBuilder headlineSmall(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.headlineSmall);

  TextBuilder titleLarge(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.titleLarge);
  TextBuilder titleMedium(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.titleMedium);
  TextBuilder titleSmall(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.titleSmall);

  TextBuilder bodyLarge(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.bodyLarge);
  TextBuilder bodyMedium(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.bodyMedium);
  TextBuilder bodySmall(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.bodySmall);

  TextBuilder labelLarge(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.labelLarge);
  TextBuilder labelMedium(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.labelMedium);
  TextBuilder labelSmall(BuildContext context) =>
      _mergeThemeStyle(Theme.of(context).textTheme.labelSmall);

  // Legacy support (headline4 = headlineMedium in Material 3)
  TextBuilder headline1(BuildContext context) => displayLarge(context);
  TextBuilder headline2(BuildContext context) => displayMedium(context);
  TextBuilder headline3(BuildContext context) => displaySmall(context);
  TextBuilder headline4(BuildContext context) => headlineMedium(context);
  TextBuilder headline5(BuildContext context) => headlineSmall(context);
  TextBuilder headline6(BuildContext context) => titleLarge(context);
  TextBuilder subtitle1(BuildContext context) => titleMedium(context);
  TextBuilder subtitle2(BuildContext context) => titleSmall(context);
  TextBuilder body1(BuildContext context) => bodyLarge(context);
  TextBuilder body2(BuildContext context) => bodyMedium(context);
  TextBuilder caption(BuildContext context) => bodySmall(context);
  TextBuilder button(BuildContext context) => labelLarge(context);

  // ========================================
  // Methods with Parameters
  // ========================================
  TextBuilder color(Color color) => _copyWith(color: color);
  TextBuilder backgroundColor(Color color) => _copyWith(backgroundColor: color);
  TextBuilder fontSize(double size) => _copyWith(fontSize: size);
  TextBuilder letterSpacing(double spacing) =>
      _copyWith(letterSpacing: spacing);
  TextBuilder wordSpacing(double spacing) => _copyWith(wordSpacing: spacing);
  TextBuilder height(double height) => _copyWith(lineHeight: height);
  TextBuilder maxLine(int lines) => _copyWith(maxLines: lines);
  TextBuilder fontFamily(String family) => _copyWith(fontFamily: family);

  /// Biriktirilmiş özellikleri materyalize edip gelen TextStyle ile birleştirir;
  /// ardından bireysel özellikler sıfırlanır (yeni baseStyle'a dahil olmuştur).
  TextBuilder style(TextStyle textStyle) {
    return TextBuilder._chain(
      _text,
      baseStyle: _buildEffectiveStyle().merge(textStyle),
      textAlign: _textAlign,
      maxLines: _maxLines,
      overflow: _overflow,
      // Bireysel özellikler yeni baseStyle'a dahil edildi; null kalır
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      // TextStyle en fazla bir kez, tam burada yaratılır
      style: _buildEffectiveStyle(),
      textAlign: _textAlign,
      maxLines: _maxLines,
      overflow: _overflow,
    );
  }
}

extension TextBuilderExtension on String {
  /// Chainable text builder başlatır.
  ///
  /// Kullanım:
  /// ```dart
  /// "Hello".text.bold.headline4(context).color(Colors.red)
  /// ```
  TextBuilder get text => TextBuilder(this);
}
