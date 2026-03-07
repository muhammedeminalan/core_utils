import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/app_bar/costum_app_bar.dart';
import 'widgets/bottom_sheet/costum_bottom_sheet.dart';
import 'widgets/buttons/costum_button.dart';
import 'widgets/buttons/costum_icon_button.dart';
import 'widgets/text_field/custom_text_field.dart';

// CustomFieldType enum'unu kullanıcılara açar; CustomTextField sınıfını gizler.
export 'widgets/text_field/custom_text_field.dart' show CustomFieldType;

/// Wonzy widget ad alanı — tüm hazır widget factory'lerine tek noktadan erişim.
///
/// Dışarıdan `Wonzy()` ile örneklenemez; yalnızca statik sabitler üzerinden erişilir.
///
/// ```dart
/// import 'package:wonzy_core_utils/wonzy_core_utils.dart';
///
/// // Standart buton
/// Wonzy.button.standard(text: 'Giriş Yap', onPressed: _onLogin)
///
/// // İkon buton
/// Wonzy.button.icon(iconData: Icons.menu, onPressed: _openMenu)
///
/// // AppBar
/// Wonzy.appBar(title: 'Ana Sayfa')
///
/// // BottomSheet (widget olarak)
/// Wonzy.bottomSheet(title: 'Filtre', child: FilterWidget())
///
/// // BottomSheet (modal olarak aç)
/// await Wonzy.bottomSheet.show(context, title: 'Filtre', child: FilterWidget())
///
/// // TextField
/// Wonzy.textField(name: 'email', type: CustomFieldType.email)
/// ```
final class Wonzy {
  /// Dışarıdan örnekleme engellenir — yalnızca statik erişim kullanılır.
  const Wonzy._();

  /// Buton widget'ları için factory nesnesi.
  ///
  /// `Wonzy.button.standard(...)` → [CustomButton]
  /// `Wonzy.button.icon(...)` → [CustomIconButton]
  static const button = _WonzyButton._();

  /// AppBar widget factory'si.
  ///
  /// `Wonzy.appBar(title: 'Başlık')` şeklinde direkt çağrılır.
  static const appBar = _WonzyAppBar._();

  /// BottomSheet widget factory'si.
  ///
  /// `Wonzy.bottomSheet(child: Widget)` → widget olarak kullan
  /// `Wonzy.bottomSheet.show(context, child: Widget)` → modal olarak aç
  static const bottomSheet = _WonzyBottomSheet._();

  /// TextField widget factory'si.
  ///
  /// `Wonzy.textField(name: 'alan', type: CustomFieldType.email)`
  static const textField = _WonzyTextField._();
}

// ═══════════════════════════════════════════════════════════════════
// BUTON FAKTORYSİ
// ═══════════════════════════════════════════════════════════════════

/// Buton widget'ları için factory sınıfı.
///
/// Dışarıdan örneklenemez; yalnızca [Wonzy.button] üzerinden erişilir.
final class _WonzyButton {
  const _WonzyButton._();

  /// Genel amaçlı metin/ikon/özel içerikli buton oluşturur.
  ///
  /// Tüm parametreler opsiyoneldir. Detaylı dokümantasyon için [CustomButton]'a bakın.
  ///
  /// ```dart
  /// Wonzy.button.standard(
  ///   text: 'Giriş Yap',
  ///   onPressed: () {},
  ///   backgroundColor: Colors.indigo,
  /// )
  /// ```
  CustomButton standard({
    Key? key,
    // ── İçerik ──
    Widget? child,
    String? text,
    Widget? icon,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    double? iconSpacing,
    // ── Aksiyon ──
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    // ── Boyut ──
    double? width,
    double? height,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    // ── Renk ──
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? overlayColor,
    Color? shadowColor,
    // ── Kenarlık ──
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    BorderSide? borderSide,
    OutlinedBorder? shape,
    // ── Tipografi ──
    TextStyle? textStyle,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextAlign? textAlign,
    // ── Yükseklik ──
    double? elevation,
    double? pressedElevation,
    double? disabledElevation,
    // ── Animasyon ──
    Duration? animationDuration,
    InteractiveInkFeatureFactory? splashFactory,
    // ── Düzen ──
    AlignmentGeometry? alignment,
    IconAlignment? iconAlignment,
    bool? isExpanded,
    bool? isLoading,
    bool? isDisabled,
    Widget? loadingWidget,
    double? loadingSize,
    Color? loadingColor,
    double? loadingStrokeWidth,
    // ── Gradient ──
    Gradient? gradient,
    // ── Tooltip & Focus ──
    String? tooltip,
    FocusNode? focusNode,
    bool? autofocus,
  }) => CustomButton(
    key: key,
    text: text,
    icon: icon,
    iconData: iconData,
    iconSize: iconSize,
    iconColor: iconColor,
    iconSpacing: iconSpacing,
    onPressed: onPressed,
    onLongPress: onLongPress,
    width: width,
    height: height,
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
    padding: padding,
    margin: margin,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    disabledBackgroundColor: disabledBackgroundColor,
    disabledForegroundColor: disabledForegroundColor,
    overlayColor: overlayColor,
    shadowColor: shadowColor,
    borderColor: borderColor,
    borderWidth: borderWidth,
    borderRadius: borderRadius,
    borderSide: borderSide,
    shape: shape,
    textStyle: textStyle,
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    textAlign: textAlign,
    elevation: elevation,
    pressedElevation: pressedElevation,
    disabledElevation: disabledElevation,
    animationDuration: animationDuration,
    splashFactory: splashFactory,
    alignment: alignment,
    iconAlignment: iconAlignment,
    isExpanded: isExpanded,
    isLoading: isLoading,
    isDisabled: isDisabled,
    loadingWidget: loadingWidget,
    loadingSize: loadingSize,
    loadingColor: loadingColor,
    loadingStrokeWidth: loadingStrokeWidth,
    gradient: gradient,
    tooltip: tooltip,
    focusNode: focusNode,
    autofocus: autofocus,
    child: child,
  );

  /// Dairesel ikon butonu oluşturur.
  ///
  /// Tüm parametreler opsiyoneldir. Detaylı dokümantasyon için [CustomIconButton]'a bakın.
  ///
  /// ```dart
  /// Wonzy.button.icon(
  ///   iconData: Icons.favorite,
  ///   onPressed: () {},
  ///   backgroundColor: Colors.red,
  ///   size: 48,
  /// )
  /// ```
  CustomIconButton icon({
    Key? key,
    // ── İçerik ──
    Widget? icon,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    // ── Aksiyon ──
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    // ── Boyut ──
    double? size,
    double? minSize,
    double? maxSize,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    // ── Renk ──
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? overlayColor,
    Color? shadowColor,
    // ── Kenarlık ──
    Color? borderColor,
    double? borderWidth,
    BorderSide? borderSide,
    // ── Yükseklik ──
    double? elevation,
    double? pressedElevation,
    double? disabledElevation,
    // ── Animasyon ──
    Duration? animationDuration,
    InteractiveInkFeatureFactory? splashFactory,
    double? splashRadius,
    // ── Durum ──
    bool? isLoading,
    bool? isDisabled,
    Widget? loadingWidget,
    double? loadingSize,
    Color? loadingColor,
    double? loadingStrokeWidth,
    // ── Gradient ──
    Gradient? gradient,
    // ── Badge ──
    int? badgeCount,
    Color? badgeColor,
    Color? badgeTextColor,
    bool? showBadge,
    // ── Tooltip & Focus ──
    String? tooltip,
    FocusNode? focusNode,
    bool? autofocus,
  }) => CustomIconButton(
    key: key,
    icon: icon,
    iconData: iconData,
    iconSize: iconSize,
    iconColor: iconColor,
    onPressed: onPressed,
    onLongPress: onLongPress,
    size: size,
    minSize: minSize,
    maxSize: maxSize,
    padding: padding,
    margin: margin,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    disabledBackgroundColor: disabledBackgroundColor,
    disabledForegroundColor: disabledForegroundColor,
    overlayColor: overlayColor,
    shadowColor: shadowColor,
    borderColor: borderColor,
    borderWidth: borderWidth,
    borderSide: borderSide,
    elevation: elevation,
    pressedElevation: pressedElevation,
    disabledElevation: disabledElevation,
    animationDuration: animationDuration,
    splashFactory: splashFactory,
    splashRadius: splashRadius,
    isLoading: isLoading,
    isDisabled: isDisabled,
    loadingWidget: loadingWidget,
    loadingSize: loadingSize,
    loadingColor: loadingColor,
    loadingStrokeWidth: loadingStrokeWidth,
    gradient: gradient,
    badgeCount: badgeCount,
    badgeColor: badgeColor,
    badgeTextColor: badgeTextColor,
    showBadge: showBadge,
    tooltip: tooltip,
    focusNode: focusNode,
    autofocus: autofocus,
  );
}

// ═══════════════════════════════════════════════════════════════════
// APPBAR FAKTORYSİ
// ═══════════════════════════════════════════════════════════════════

/// AppBar widget'ı için factory sınıfı.
///
/// Dışarıdan örneklenemez; yalnızca [Wonzy.appBar] üzerinden erişilir.
/// `call()` operatörü sayesinde `Wonzy.appBar(title: ...)` sözdizimi desteklenir.
final class _WonzyAppBar {
  const _WonzyAppBar._();

  /// Özelleştirilebilir AppBar oluşturur.
  ///
  /// `call()` operatörü — `Wonzy.appBar(title: 'Başlık', centerTitle: true)` şeklinde çağrılır.
  ///
  /// Tüm parametreler [CustomAppBar] constructor'una aktarılır.
  ///
  /// ```dart
  /// Scaffold(
  ///   appBar: Wonzy.appBar(title: 'Ana Sayfa', centerTitle: true),
  /// )
  /// ```
  CustomAppBar call({
    Key? key,
    // ── Başlık ──
    String? title,
    Widget? titleWidget,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    double? titleSpacing,
    bool? centerTitle,
    // ── Leading ──
    Widget? leading,
    IconData? leadingIcon,
    Color? leadingIconColor,
    double? leadingIconSize,
    VoidCallback? onLeadingPressed,
    bool? automaticallyImplyLeading,
    double? leadingWidth,
    // ── Actions ──
    List<Widget>? actions,
    IconThemeData? actionsIconTheme,
    EdgeInsetsGeometry? actionsPadding,
    // ── Renk & Arka Plan ──
    Color? backgroundColor,
    Color? foregroundColor,
    Color? surfaceTintColor,
    Gradient? gradient,
    Color? shadowColor,
    // ── Yükseklik ──
    double? elevation,
    double? scrolledUnderElevation,
    // ── Boyut ──
    double? toolbarHeight,
    double? toolbarOpacity,
    // ── Şekil ──
    ShapeBorder? shape,
    double? borderRadius,
    BorderSide? border,
    // ── Bottom ──
    PreferredSizeWidget? bottom,
    // ── FlexibleSpace ──
    Widget? flexibleSpace,
    // ── Status Bar ──
    SystemUiOverlayStyle? systemOverlayStyle,
    Brightness? brightness,
    // ── Davranış ──
    bool? primary,
    bool? excludeHeaderSemantics,
    bool? forceMaterialTransparency,
    Clip? clipBehavior,
    // ── Ek İçerik ──
    bool? bottomSeparator,
    Color? bottomSeparatorColor,
    double? bottomSeparatorHeight,
  }) => CustomAppBar(
    key: key,
    title: title,
    titleWidget: titleWidget,
    titleStyle: titleStyle,
    titleColor: titleColor,
    titleFontSize: titleFontSize,
    titleFontWeight: titleFontWeight,
    titleSpacing: titleSpacing,
    centerTitle: centerTitle,
    leading: leading,
    leadingIcon: leadingIcon,
    leadingIconColor: leadingIconColor,
    leadingIconSize: leadingIconSize,
    onLeadingPressed: onLeadingPressed,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leadingWidth: leadingWidth,
    actions: actions,
    actionsIconTheme: actionsIconTheme,
    actionsPadding: actionsPadding,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: surfaceTintColor,
    gradient: gradient,
    shadowColor: shadowColor,
    elevation: elevation,
    scrolledUnderElevation: scrolledUnderElevation,
    toolbarHeight: toolbarHeight,
    toolbarOpacity: toolbarOpacity,
    shape: shape,
    borderRadius: borderRadius,
    border: border,
    bottom: bottom,
    flexibleSpace: flexibleSpace,
    systemOverlayStyle: systemOverlayStyle,
    brightness: brightness,
    primary: primary,
    excludeHeaderSemantics: excludeHeaderSemantics,
    forceMaterialTransparency: forceMaterialTransparency,
    clipBehavior: clipBehavior,
    bottomSeparator: bottomSeparator,
    bottomSeparatorColor: bottomSeparatorColor,
    bottomSeparatorHeight: bottomSeparatorHeight,
  );
}

// ═══════════════════════════════════════════════════════════════════
// BOTTOM SHEET FAKTORYSİ
// ═══════════════════════════════════════════════════════════════════

/// BottomSheet widget'ı için factory sınıfı.
///
/// Dışarıdan örneklenemez; yalnızca [Wonzy.bottomSheet] üzerinden erişilir.
/// `call()` ile widget, `show()` ile modal olarak kullanılır.
final class _WonzyBottomSheet {
  const _WonzyBottomSheet._();

  /// BottomSheet widget'ı oluşturur (doğrudan widget ağacına eklenir).
  ///
  /// Modal olarak açmak için [show] metodunu kullanın.
  ///
  /// ```dart
  /// Wonzy.bottomSheet(title: 'Başlık', child: MyContent())
  /// ```
  CustomBottomSheet call({
    Key? key,
    // ── İçerik ──
    Widget? child,
    List<Widget>? children,
    String? title,
    Widget? titleWidget,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    TextAlign? titleAlignment,
    String? subtitle,
    Widget? subtitleWidget,
    TextStyle? subtitleStyle,
    String? message,
    Widget? messageWidget,
    TextStyle? messageStyle,
    Widget? icon,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Widget? image,
    // ── Handle ──
    bool? showHandle,
    Color? handleColor,
    double? handleWidth,
    double? handleHeight,
    EdgeInsetsGeometry? handleMargin,
    BoxDecoration? handleDecoration,
    // ── Kapatma ──
    bool? showCloseButton,
    Widget? closeIcon,
    Color? closeIconColor,
    double? closeIconSize,
    VoidCallback? onClose,
    AlignmentGeometry? closeButtonAlignment,
    // ── Header ──
    Widget? header,
    EdgeInsetsGeometry? headerPadding,
    BoxDecoration? headerDecoration,
    bool? headerSeparator,
    Color? headerSeparatorColor,
    double? headerSeparatorHeight,
    // ── Footer ──
    Widget? footer,
    EdgeInsetsGeometry? footerPadding,
    BoxDecoration? footerDecoration,
    bool? footerSeparator,
    Color? footerSeparatorColor,
    double? footerSeparatorHeight,
    // ── Aksiyonlar ──
    Widget? primaryAction,
    String? primaryActionText,
    VoidCallback? onPrimaryAction,
    Widget? secondaryAction,
    String? secondaryActionText,
    VoidCallback? onSecondaryAction,
    Axis? actionsAxis,
    double? actionsSpacing,
    EdgeInsetsGeometry? actionsPadding,
    // ── Renk ──
    Color? backgroundColor,
    Color? barrierColor,
    Color? surfaceTintColor,
    Gradient? gradient,
    Color? shadowColor,
    // ── Boyut ──
    double? height,
    double? minHeight,
    double? maxHeight,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? margin,
    // ── Şekil ──
    double? borderRadius,
    double? topLeftRadius,
    double? topRightRadius,
    double? bottomLeftRadius,
    double? bottomRightRadius,
    BoxBorder? border,
    Color? borderColor,
    double? borderWidth,
    ShapeBorder? shape,
    // ── Elevation ──
    double? elevation,
    // ── Scroll ──
    bool? isScrollable,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    EdgeInsetsGeometry? scrollPadding,
    bool? shrinkWrap,
    // ── Draggable ──
    bool? isDraggable,
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    bool? snap,
    List<double>? snapSizes,
    bool? shouldCloseOnMinExtent,
    // ── Davranış ──
    bool? isDismissible,
    bool? enableDrag,
    bool? isModal,
    bool? useRootNavigator,
    bool? useSafeArea,
    // ── Animasyon ──
    Duration? animationDuration,
    Curve? animationCurve,
    AnimationController? transitionAnimationController,
    // ── Erişilebilirlik ──
    String? semanticLabel,
    RouteSettings? routeSettings,
    // ── Boyut Kısıtları ──
    BoxConstraints? constraints,
    // ── Callback ──
    VoidCallback? onDismissed,
  }) => CustomBottomSheet(
    key: key,
    child: child,
    children: children,
    title: title,
    titleWidget: titleWidget,
    titleStyle: titleStyle,
    titleColor: titleColor,
    titleFontSize: titleFontSize,
    titleFontWeight: titleFontWeight,
    titleAlignment: titleAlignment,
    subtitle: subtitle,
    subtitleWidget: subtitleWidget,
    subtitleStyle: subtitleStyle,
    message: message,
    messageWidget: messageWidget,
    messageStyle: messageStyle,
    icon: icon,
    iconData: iconData,
    iconSize: iconSize,
    iconColor: iconColor,
    image: image,
    showHandle: showHandle,
    handleColor: handleColor,
    handleWidth: handleWidth,
    handleHeight: handleHeight,
    handleMargin: handleMargin,
    handleDecoration: handleDecoration,
    showCloseButton: showCloseButton,
    closeIcon: closeIcon,
    closeIconColor: closeIconColor,
    closeIconSize: closeIconSize,
    onClose: onClose,
    closeButtonAlignment: closeButtonAlignment,
    header: header,
    headerPadding: headerPadding,
    headerDecoration: headerDecoration,
    headerSeparator: headerSeparator,
    headerSeparatorColor: headerSeparatorColor,
    headerSeparatorHeight: headerSeparatorHeight,
    footer: footer,
    footerPadding: footerPadding,
    footerDecoration: footerDecoration,
    footerSeparator: footerSeparator,
    footerSeparatorColor: footerSeparatorColor,
    footerSeparatorHeight: footerSeparatorHeight,
    primaryAction: primaryAction,
    primaryActionText: primaryActionText,
    onPrimaryAction: onPrimaryAction,
    secondaryAction: secondaryAction,
    secondaryActionText: secondaryActionText,
    onSecondaryAction: onSecondaryAction,
    actionsAxis: actionsAxis,
    actionsSpacing: actionsSpacing,
    actionsPadding: actionsPadding,
    backgroundColor: backgroundColor,
    barrierColor: barrierColor,
    surfaceTintColor: surfaceTintColor,
    gradient: gradient,
    shadowColor: shadowColor,
    height: height,
    minHeight: minHeight,
    maxHeight: maxHeight,
    width: width,
    padding: padding,
    contentPadding: contentPadding,
    margin: margin,
    borderRadius: borderRadius,
    topLeftRadius: topLeftRadius,
    topRightRadius: topRightRadius,
    bottomLeftRadius: bottomLeftRadius,
    bottomRightRadius: bottomRightRadius,
    border: border,
    borderColor: borderColor,
    borderWidth: borderWidth,
    shape: shape,
    elevation: elevation,
    isScrollable: isScrollable,
    scrollController: scrollController,
    scrollPhysics: scrollPhysics,
    scrollPadding: scrollPadding,
    shrinkWrap: shrinkWrap,
    isDraggable: isDraggable,
    initialChildSize: initialChildSize,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
    snap: snap,
    snapSizes: snapSizes,
    shouldCloseOnMinExtent: shouldCloseOnMinExtent,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isModal: isModal,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    animationDuration: animationDuration,
    animationCurve: animationCurve,
    transitionAnimationController: transitionAnimationController,
    semanticLabel: semanticLabel,
    routeSettings: routeSettings,
    constraints: constraints,
    onDismissed: onDismissed,
  );

  /// BottomSheet'i modal olarak açar ve sonucu döndürür.
  ///
  /// [CustomBottomSheet.show] metodunu çağırır.
  ///
  /// ```dart
  /// final sonuc = await Wonzy.bottomSheet.show<bool>(
  ///   context,
  ///   title: 'Emin misiniz?',
  ///   primaryActionText: 'Evet',
  ///   onPrimaryAction: () => Navigator.pop(context, true),
  /// );
  /// ```
  Future<T?> show<T>(
    BuildContext context, {
    // ── İçerik ──
    Widget? child,
    List<Widget>? children,
    String? title,
    Widget? titleWidget,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    TextAlign? titleAlignment,
    String? subtitle,
    Widget? subtitleWidget,
    TextStyle? subtitleStyle,
    String? message,
    Widget? messageWidget,
    TextStyle? messageStyle,
    Widget? icon,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Widget? image,
    // ── Handle ──
    bool? showHandle,
    Color? handleColor,
    double? handleWidth,
    double? handleHeight,
    EdgeInsetsGeometry? handleMargin,
    BoxDecoration? handleDecoration,
    // ── Kapatma ──
    bool? showCloseButton,
    Widget? closeIcon,
    Color? closeIconColor,
    double? closeIconSize,
    VoidCallback? onClose,
    AlignmentGeometry? closeButtonAlignment,
    // ── Header ──
    Widget? header,
    EdgeInsetsGeometry? headerPadding,
    BoxDecoration? headerDecoration,
    bool? headerSeparator,
    Color? headerSeparatorColor,
    double? headerSeparatorHeight,
    // ── Footer ──
    Widget? footer,
    EdgeInsetsGeometry? footerPadding,
    BoxDecoration? footerDecoration,
    bool? footerSeparator,
    Color? footerSeparatorColor,
    double? footerSeparatorHeight,
    // ── Aksiyonlar ──
    Widget? primaryAction,
    String? primaryActionText,
    VoidCallback? onPrimaryAction,
    Widget? secondaryAction,
    String? secondaryActionText,
    VoidCallback? onSecondaryAction,
    Axis? actionsAxis,
    double? actionsSpacing,
    EdgeInsetsGeometry? actionsPadding,
    // ── Renk ──
    Color? backgroundColor,
    Color? barrierColor,
    Color? surfaceTintColor,
    Gradient? gradient,
    Color? shadowColor,
    // ── Boyut ──
    double? height,
    double? minHeight,
    double? maxHeight,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? margin,
    // ── Şekil ──
    double? borderRadius,
    double? topLeftRadius,
    double? topRightRadius,
    double? bottomLeftRadius,
    double? bottomRightRadius,
    BoxBorder? border,
    Color? borderColor,
    double? borderWidth,
    ShapeBorder? shape,
    // ── Elevation ──
    double? elevation,
    // ── Scroll ──
    bool? isScrollable,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    EdgeInsetsGeometry? scrollPadding,
    bool? shrinkWrap,
    // ── Draggable ──
    bool? isDraggable,
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    bool? snap,
    List<double>? snapSizes,
    bool? shouldCloseOnMinExtent,
    // ── Davranış ──
    bool? isDismissible,
    bool? enableDrag,
    bool? useRootNavigator,
    bool? useSafeArea,
    // ── Animasyon ──
    AnimationController? transitionAnimationController,
    // ── Erişilebilirlik ──
    String? semanticLabel,
    RouteSettings? routeSettings,
    // ── Boyut Kısıtları ──
    BoxConstraints? constraints,
    // ── Callback ──
    VoidCallback? onDismissed,
  }) => CustomBottomSheet.show<T>(
    context,
    child: child,
    children: children,
    title: title,
    titleWidget: titleWidget,
    titleStyle: titleStyle,
    titleColor: titleColor,
    titleFontSize: titleFontSize,
    titleFontWeight: titleFontWeight,
    titleAlignment: titleAlignment,
    subtitle: subtitle,
    subtitleWidget: subtitleWidget,
    subtitleStyle: subtitleStyle,
    message: message,
    messageWidget: messageWidget,
    messageStyle: messageStyle,
    icon: icon,
    iconData: iconData,
    iconSize: iconSize,
    iconColor: iconColor,
    image: image,
    showHandle: showHandle,
    handleColor: handleColor,
    handleWidth: handleWidth,
    handleHeight: handleHeight,
    handleMargin: handleMargin,
    handleDecoration: handleDecoration,
    showCloseButton: showCloseButton,
    closeIcon: closeIcon,
    closeIconColor: closeIconColor,
    closeIconSize: closeIconSize,
    onClose: onClose,
    closeButtonAlignment: closeButtonAlignment,
    header: header,
    headerPadding: headerPadding,
    headerDecoration: headerDecoration,
    headerSeparator: headerSeparator,
    headerSeparatorColor: headerSeparatorColor,
    headerSeparatorHeight: headerSeparatorHeight,
    footer: footer,
    footerPadding: footerPadding,
    footerDecoration: footerDecoration,
    footerSeparator: footerSeparator,
    footerSeparatorColor: footerSeparatorColor,
    footerSeparatorHeight: footerSeparatorHeight,
    primaryAction: primaryAction,
    primaryActionText: primaryActionText,
    onPrimaryAction: onPrimaryAction,
    secondaryAction: secondaryAction,
    secondaryActionText: secondaryActionText,
    onSecondaryAction: onSecondaryAction,
    actionsAxis: actionsAxis,
    actionsSpacing: actionsSpacing,
    actionsPadding: actionsPadding,
    backgroundColor: backgroundColor,
    barrierColor: barrierColor,
    surfaceTintColor: surfaceTintColor,
    gradient: gradient,
    shadowColor: shadowColor,
    height: height,
    minHeight: minHeight,
    maxHeight: maxHeight,
    width: width,
    padding: padding,
    contentPadding: contentPadding,
    margin: margin,
    borderRadius: borderRadius,
    topLeftRadius: topLeftRadius,
    topRightRadius: topRightRadius,
    bottomLeftRadius: bottomLeftRadius,
    bottomRightRadius: bottomRightRadius,
    border: border,
    borderColor: borderColor,
    borderWidth: borderWidth,
    shape: shape,
    elevation: elevation,
    isScrollable: isScrollable,
    scrollController: scrollController,
    scrollPhysics: scrollPhysics,
    scrollPadding: scrollPadding,
    shrinkWrap: shrinkWrap,
    isDraggable: isDraggable,
    initialChildSize: initialChildSize,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
    snap: snap,
    snapSizes: snapSizes,
    shouldCloseOnMinExtent: shouldCloseOnMinExtent,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    transitionAnimationController: transitionAnimationController,
    semanticLabel: semanticLabel,
    routeSettings: routeSettings,
    constraints: constraints,
    onDismissed: onDismissed,
  );
}

// ═══════════════════════════════════════════════════════════════════
// TEXT FIELD FAKTORYSİ
// ═══════════════════════════════════════════════════════════════════

/// TextField widget'ı için factory sınıfı.
///
/// Dışarıdan örneklenemez; yalnızca [Wonzy.textField] üzerinden erişilir.
/// `call()` operatörü sayesinde `Wonzy.textField(name: ...)` sözdizimi desteklenir.
final class _WonzyTextField {
  const _WonzyTextField._();

  /// Tip tabanlı akıllı metin alanı oluşturur.
  ///
  /// [name] zorunludur (FormBuilder alan tanımlayıcısı).
  /// [type] parametresi klavye, autofill ve doğrulama davranışlarını belirler.
  ///
  /// ```dart
  /// Wonzy.textField(
  ///   name: 'email',
  ///   type: CustomFieldType.email,
  ///   label: 'E-posta',
  ///   required: true,
  /// )
  /// ```
  CustomTextField call({
    Key? key,
    // ── Zorunlu ──
    required String name,
    // ── Tip ──
    CustomFieldType type = CustomFieldType.text,
    // ── Etiket / İpucu / Yardım ──
    String? label,
    String? hint,
    String? helperText,
    String? initialValue,
    // ── Kontrolcüler & Odak ──
    TextEditingController? controller,
    FocusNode? focusNode,
    FocusNode? nextFocusNode,
    // ── Bayraklar ──
    bool enabled = true,
    bool readOnly = false,
    bool autofocus = false,
    bool? obscureText,
    bool enableSuggestions = true,
    bool autocorrect = true,
    // ── Uzunluk & Satır ──
    int? maxLength,
    int maxLines = 1,
    int? minLines,
    // ── Giriş ──
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    Iterable<String>? autofillHints,
    // ── Arayüz Eklentileri ──
    bool showCounter = false,
    bool showClearButton = false,
    bool showPasswordToggle = true,
    Widget? prefixIcon,
    Widget? suffixIcon,
    // ── Geri Çağırmalar ──
    VoidCallback? onTap,
    ValueChanged<String?>? onChanged,
    ValueChanged<String?>? onSubmitted,

    /// FormBuilder'a iletilen değer dönüştürücü.
    String? Function(String?)? transform,
    // ── Doğrulama Modu ──
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    // ── Doğrulama Yapılandırması ──
    bool required = false,
    String? requiredMessage,
    int? minLength,
    int? maxLengthValidator,
    String? invalidEmailMessage,
    String? invalidPhoneMessage,
    String? minLengthMessage,
    String? maxLengthMessage,
    String? numericMessage,
    FormFieldValidator<String>? customValidator,
    // ── Dekorasyon Override ──
    InputDecoration? decoration,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    // ── Metin Stilleri ──
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
  }) => CustomTextField(
    key: key,
    name: name,
    type: type,
    label: label,
    hint: hint,
    helperText: helperText,
    initialValue: initialValue,
    controller: controller,
    focusNode: focusNode,
    nextFocusNode: nextFocusNode,
    enabled: enabled,
    readOnly: readOnly,
    autofocus: autofocus,
    obscureText: obscureText,
    enableSuggestions: enableSuggestions,
    autocorrect: autocorrect,
    maxLength: maxLength,
    maxLines: maxLines,
    minLines: minLines,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    autofillHints: autofillHints,
    showCounter: showCounter,
    showClearButton: showClearButton,
    showPasswordToggle: showPasswordToggle,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    onTap: onTap,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    transform: transform,
    autovalidateMode: autovalidateMode,
    required: required,
    requiredMessage: requiredMessage,
    minLength: minLength,
    maxLengthValidator: maxLengthValidator,
    invalidEmailMessage: invalidEmailMessage,
    invalidPhoneMessage: invalidPhoneMessage,
    minLengthMessage: minLengthMessage,
    maxLengthMessage: maxLengthMessage,
    numericMessage: numericMessage,
    customValidator: customValidator,
    decoration: decoration,
    contentPadding: contentPadding,
    border: border,
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
    errorBorder: errorBorder,
    style: style,
    labelStyle: labelStyle,
    hintStyle: hintStyle,
  );
}
