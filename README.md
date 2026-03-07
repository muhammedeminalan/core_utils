# wonzy_core_utils

[![pub package](https://img.shields.io/pub/v/wonzy_core_utils.svg)](https://pub.dev/packages/wonzy_core_utils)
[![CI](https://github.com/muhammedeminalan/core_utils/actions/workflows/ci.yml/badge.svg)](https://github.com/muhammedeminalan/core_utils/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.29.0-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.11.0-0175C2?logo=dart)](https://dart.dev)

A comprehensive collection of **Flutter/Dart extensions** and **reusable widgets** that eliminate boilerplate and accelerate UI development. One import, dozens of superpowers.

```dart
import 'package:wonzy_core_utils/wonzy_core_utils.dart';
```

---

## Table of Contents

- [Installation](#installation)
- [Context Extensions](#context-extensions)
- [Num Extensions (Spacing, Padding, Duration)](#num-extensions)
- [String Extensions](#string-extensions)
- [Text Builder (Chainable API)](#text-builder)
- [Widget Extensions](#widget-extensions)
  - [Padding & Margin](#padding--margin)
  - [Alignment](#alignment)
  - [Container](#container)
  - [Expanded & Flexible](#expanded--flexible)
  - [Size Constraints](#size-constraints)
  - [Decoration & Interaction](#decoration--interaction)
  - [Transform](#transform)
  - [Clip & Border](#clip--border)
  - [Helpers (Tooltip, Hero, SafeArea, etc.)](#helpers)
- [Image Extensions](#image-extensions)
- [String → Image Shortcuts](#string--image-shortcuts)
- [Layout Extensions](#layout-extensions)
- [Navigation Extensions](#navigation-extensions)
- [Route Transitions](#route-transitions)
- [Log Extensions](#log-extensions)
- [Wonzy Widget Namespace](#wonzy-widget-namespace)
  - [Wonzy.appBar](#wonzyappbar)
  - [Wonzy.button.standard](#wonzybuttonstandard)
  - [Wonzy.button.icon](#wonzybuttonicon)
  - [Wonzy.bottomSheet / Wonzy.bottomSheet.show](#wonzybottomsheet--wonzybottomsheetshow)
  - [Wonzy.textField](#wonzytextfield)
- [Full Export Tree](#full-export-tree)
- [Requirements](#requirements)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

### Option A — pub.dev (recommended)

```yaml
dependencies:
  wonzy_core_utils: ^2.0.0
```

### Option B — Git dependency

```yaml
dependencies:
  wonzy_core_utils:
    git:
      url: https://github.com/muhammedeminalan/core_utils.git
      ref: v2.0.0
```

Then run:

```bash
flutter pub get
```

Then import:

```dart
import 'package:wonzy_core_utils/wonzy_core_utils.dart';
```

---

## Context Extensions

Shortcuts on `BuildContext` for screen size, theme, colors, and text styles.

```dart
// ── Screen Size ──
context.screenSize          // MediaQuery size
context.width               // screen width
context.height              // screen height
context.screenHeight(0.5)   // 50% of screen height
context.screenWidth(0.3)    // 30% of screen width

// ── Theme ──
context.theme               // ThemeData
context.colorScheme         // ColorScheme

// ── Color Shortcuts ──
context.primaryColor        // colorScheme.primary
context.secondaryColor      // colorScheme.secondary
context.errorColor          // colorScheme.error
context.surfaceColor        // colorScheme.surface
context.onPrimaryColor      // colorScheme.onPrimary
context.onSecondaryColor    // colorScheme.onSecondary
context.onSurfaceColor      // colorScheme.onSurface
context.outlineColor        // colorScheme.outline

// ── Text Style Shortcuts ──
context.displayLarge        // textTheme.displayLarge!
context.displayMedium       // textTheme.displayMedium!
context.headlineLarge       // textTheme.headlineLarge!
context.headlineMedium      // textTheme.headlineMedium!
context.titleLarge          // textTheme.titleLarge!
context.titleMedium         // textTheme.titleMedium!
context.bodyLarge           // textTheme.bodyLarge!
context.bodyMedium          // textTheme.bodyMedium!
context.labelLarge          // textTheme.labelLarge!
context.labelSmall          // textTheme.labelSmall!

// ── Widget Theme Shortcuts ──
context.appBarTheme         // theme.appBarTheme
context.cardTheme           // theme.cardTheme
context.inputTheme          // theme.inputDecorationTheme
context.elevatedButtonTheme // theme.elevatedButtonTheme
context.bottomNavTheme      // theme.bottomNavigationBarTheme

// ── Divider ──
context.divider(color: Colors.grey)
```

---

## Num Extensions

Turn any `num` into spacing, padding, radius, or duration — zero boilerplate.

```dart
// ── SizedBox Spacing ──
16.h          // SizedBox(height: 16)
24.w          // SizedBox(width: 24)
16.height     // SizedBox(height: 16)  — alias
24.width      // SizedBox(width: 24)   — alias

// ── EdgeInsets ──
12.all        // EdgeInsets.all(12)
16.horizontal // EdgeInsets.symmetric(horizontal: 16)
8.vertical    // EdgeInsets.symmetric(vertical: 8)

// ── BorderRadius ──
8.radius      // BorderRadius.circular(8)

// ── Duration ──
300.ms        // Duration(milliseconds: 300)
2.seconds     // Duration(seconds: 2)
```

**Real-world usage:**

```dart
Column(
  children: [
    Text('Title'),
    16.h,              // instead of SizedBox(height: 16)
    Text('Subtitle'),
    24.h,
    ElevatedButton(...)
        .paddingAll(12) // uses 12.all internally
  ],
)
```

---

## String Extensions

Rich set of string manipulation, formatting, validation, and conversion utilities.

### Case Conversion

```dart
'hello world'.capitalize()    // "Hello world"
'hello world'.toTitleCase()   // "Hello World"
'hello world'.toSnakeCase()   // "hello_world"
'hello world'.toKebabCase()   // "hello-world"
'hello world'.toCamelCase()   // "helloWorld"
```

### Validation

```dart
'42'.isNumeric              // true
'hello'.isAlphabetic        // true
'abc123'.isAlphanumeric     // true
'abc123'.hasNumber          // true
'abc123'.hasLetter          // true
''.isNullOrEmpty            // true
'hello'.isNotNullOrEmpty    // true
```

### Manipulation

```dart
'Hello World'.reversed               // "dlroW olleH"
'Hello World'.ellipsis(5)            // "Hello..."
'Hello World'.trimmed                // "Hello World" (trim shortcut)
'Hello World'.containsIgnoreCase('hello')  // true
'Hello World'.replaceAllIgnoreCase('hello', 'Hi')  // "Hi World"
'<b>bold</b>'.stripHtml              // "bold"
'true'.toBool                        // true
'Hello World'.splitToList            // ["Hello", "World"]
'abc'.charAtOr(5, 'x')              // "x" (safe index access)
'abc'.padLeftToLength(6, '0')        // "000abc"
'abc'.padRightToLength(6, '0')       // "abc000"
'abc'.lengthSafe                     // 3
```

### Turkish Formatters

```dart
'5551234567'.toTurkishPhoneFormat()  // "+90 0555 123 4567"
'john'.toUsername()                  // "@john"
'@john'.toUsername()                 // "@john" (no double @)
'john'.toGmail()                    // "john@gmail.com"
'JOHN@gmail.com'.toGmail()          // "john@gmail.com"
```

---

## Text Builder

A fully **chainable API** to build styled `Text` widgets from any `String`. No more nested `Text()` + `TextStyle()` boilerplate.

```dart
// Basic usage
'Hello World'.text                   // plain Text widget

// Font weight
'Bold'.text.bold                     // FontWeight.w700
'Light'.text.light                   // FontWeight.w300
'Medium'.text.medium                 // FontWeight.w500
'SemiBold'.text.semiBold             // FontWeight.w600
'Black'.text.black                   // FontWeight.w900

// Font style
'Italic'.text.italic                 // FontStyle.italic

// Decoration
'Underline'.text.underline
'Strikethrough'.text.lineThrough
'Overline'.text.overline

// Alignment
'Centered'.text.alignCenter
'Right'.text.alignRight
'Justified'.text.alignJustify

// Overflow
'Long text...'.text.ellipsis.maxLine(2)

// Custom values
'Custom'.text
    .color(Colors.red)
    .backgroundColor(Colors.yellow)
    .fontSize(20)
    .letterSpacing(1.5)
    .wordSpacing(2.0)
    .height(1.4)
    .fontFamily('Roboto')

// Theme-based typography (Material 3)
'Display'.text.displayLarge(context)
'Headline'.text.headlineMedium(context)
'Title'.text.titleLarge(context)
'Body'.text.bodyMedium(context)
'Label'.text.labelSmall(context)

// Legacy Material 2 names (still supported)
'Legacy'.text.headline4(context)
'Legacy'.text.subtitle1(context)
'Legacy'.text.body1(context)
'Legacy'.text.caption(context)

// Merge with existing style
'Merged'.text.style(myTextStyle)

// ── Full chain example ──
'Welcome Back!'.text
    .bold
    .italic
    .titleLarge(context)
    .color(Colors.indigo)
    .letterSpacing(0.5)
    .maxLine(1)
    .ellipsis
```

---

## Widget Extensions

### Padding & Margin

```dart
// Padding
widget.paddingAll(16)                     // all sides
widget.paddingHorizontal(12)              // left + right
widget.paddingVertical(8)                 // top + bottom
widget.paddingSymmetric(h: 16, v: 8)     // symmetric
widget.paddingOnly(left: 8, top: 16)     // specific sides
widget.padding(EdgeInsets.all(10))        // custom EdgeInsets

// Margin (uses Container internally)
widget.marginAll(16)
widget.marginHorizontal(12)
widget.marginVertical(8)
widget.marginOnly(left: 8, bottom: 16)
```

### Alignment

```dart
widget.center          // Center(child: widget)
widget.alignLeft       // Alignment.centerLeft
widget.alignRight      // Alignment.centerRight
widget.alignTop        // Alignment.topCenter
widget.alignBottom     // Alignment.bottomCenter
widget.align(Alignment.topRight)  // custom
```

### Container

Wrap any widget in a fully customizable `Container` — one method call:

```dart
Text('Hello').container(
  color: Colors.blue,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  borderRadius: 12,
  width: 200,
  height: 50,
  gradient: LinearGradient(...),
  border: Border.all(color: Colors.white),
  boxShadow: [BoxShadow(...)],
  alignment: Alignment.center,
)
```

### Expanded & Flexible

```dart
widget.expanded()           // Expanded(child: widget)
widget.expanded(flex: 2)    // Expanded(flex: 2, child: widget)
widget.flexible()           // Flexible(child: widget)
widget.flexible(flex: 2, fit: FlexFit.tight)
```

### Size Constraints

```dart
widget.sized(width: 100, height: 50)    // SizedBox wrapper
widget.square(60)                        // square SizedBox(60×60)
widget.expandedWidth                     // width: double.infinity
widget.expandedHeight                    // height: double.infinity
widget.constrained(
  minWidth: 100,
  maxWidth: 300,
  minHeight: 50,
  maxHeight: 200,
)
```

### Decoration & Interaction

```dart
// ── Rounded Box ──
Text('Chip').roundedBox(
  radius: 20,
  backgroundColor: Colors.blue,
  gradient: LinearGradient(...),
  border: Border.all(color: Colors.white),
  shadow: [BoxShadow(...)],
  innerPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  outerMargin: EdgeInsets.all(4),
  width: 120,
  height: 40,
)

// ── Background ──
Icon(Icons.star).withBackground(
  Colors.amber,
  radius: 8,
  innerPadding: EdgeInsets.all(8),
)

// ── Shadow ──
widget.withShadow(
  color: Colors.black26,
  blurRadius: 8,
  offset: Offset(0, 2),
  spreadRadius: 0,
  borderRadius: 12,
)

// ── Card ──
widget.asCard(elevation: 4, radius: 16, color: Colors.white)

// ── Tap ──
widget.onTap(() => doSomething())
widget.onTap(() => doSomething(), borderRadius: BorderRadius.circular(8))

// ── InkWell (Material ripple) ──
widget.onInkTap(
  () => doSomething(),
  borderRadius: BorderRadius.circular(8),
  splashColor: Colors.blue.withOpacity(0.2),
)

// ── Long Press ──
widget.onLongPress(() => showMenu())

// ── Visibility ──
widget.withVisibility(false)                  // hidden
widget.withVisibility(false, maintainSize: true) // invisible but takes space

// ── Opacity ──
widget.withOpacity(0.5)

// ── Border ──
widget.withBorder(color: Colors.grey, width: 1, radius: 8)
```

### Transform

```dart
widget.rotated(0.785)                          // rotate by radians (≈45°)
widget.scaled(1.2)                             // scale up 120%
widget.translated(Offset(10, -5))              // translate by offset
```

### Clip & Border

```dart
widget.clipRect()                              // ClipRect
widget.clipOval()                              // ClipOval (circle/ellipse)
widget.clipRounded(12)                         // ClipRRect with radius
widget.asCircle(size: 80, backgroundColor: Colors.grey)  // circle container
```

### Helpers

```dart
widget.withTooltip('Helpful info')             // Tooltip wrapper
widget.asHero('unique-tag')                    // Hero animation
widget.withAspectRatio(16 / 9)                 // AspectRatio
widget.safeArea()                              // SafeArea (all edges)
widget.safeArea(top: true, bottom: false)      // selective SafeArea
widget.ignorePointer()                         // IgnorePointer
widget.absorbPointer()                         // AbsorbPointer
```

---

## Image Extensions

Extensions on `Image` widgets for shape, filter, overlay, and animation.

### Shape

```dart
Image.asset('photo.png').rounded(16)           // rounded corners
Image.asset('photo.png').circular(size: 80)    // circular crop
Image.asset('photo.png').bordered(
  color: Colors.white,
  width: 3,
  radius: 12,
)
Image.network(url).circleAvatar(
  size: 60,
  borderColor: Colors.white,
  borderWidth: 2,
  shadow: [BoxShadow(blurRadius: 8)],
)
```

### Shadow & Color

```dart
Image.asset('photo.png').shadow(
  blurRadius: 12,
  offset: Offset(0, 4),
  color: Colors.black26,
)

Image.asset('photo.png').colorFiltered(
  color: Colors.blue,
  blendMode: BlendMode.colorBurn,
)

Image.asset('photo.png').grayscale()           // black & white
Image.asset('photo.png').sepia()               // antique effect
Image.asset('photo.png').opacity(0.7)          // semi-transparent
```

### Blur & Overlay

```dart
Image.asset('bg.png').blurred(sigmaX: 5, sigmaY: 5)

Image.asset('banner.png').gradientOverlay(
  colors: [Colors.transparent, Colors.black87],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  borderRadius: 12,
)

Image.asset('banner.png').colorOverlay(Colors.black45)
```

### Size & Animation

```dart
Image.asset('photo.png').sized(width: 200, height: 150)
Image.asset('photo.png').ratio(16 / 9)
Image.network(url).fadeIn(duration: Duration(milliseconds: 500))
```

---

## String → Image Shortcuts

Create image widgets directly from strings:

```dart
// ── Asset ──
'assets/logo.png'.asAssetImage(width: 120, fit: BoxFit.contain)

// ── Network ──
'https://example.com/photo.jpg'.asNetworkImage(
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)

// ── Smart Network (with loading spinner + error fallback) ──
'https://example.com/photo.jpg'.asSmartNetworkImage(
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  borderRadius: 12,
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.error),
)

// ── Image Providers ──
'assets/logo.png'.toAssetImageProvider()
'https://example.com/photo.jpg'.toNetworkImageProvider()

// ── Decoration Images (for Container backgrounds) ──
'assets/bg.png'.asDecorationImage(fit: BoxFit.cover)
'https://example.com/bg.jpg'.asNetworkDecorationImage(opacity: 0.8)

// ── ImageProvider Extensions ──
AssetImage('logo.png').toImage(width: 100)
NetworkImage(url).toCircleAvatar(radius: 30)
AssetImage('logo.png').toDecorationImage(fit: BoxFit.cover)
NetworkImage(url).toInk(width: 200, height: 150)
```

---

## Layout Extensions

### List → Column / Row

Build `Column` or `Row` from a list of widgets with optional spacing:

```dart
// Column with spacing
[
  Text('First'),
  Text('Second'),
  Text('Third'),
].column(spacing: 8)

// Column with full customization
[widgets].column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  spacing: 12,
)

// Row with spacing
[Icon(Icons.star), Text('Favorite')].row(spacing: 4)

// Row with full customization
[widgets].row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  spacing: 8,
)
```

### Axis Alignment on Existing Widgets

Chain alignment properties directly on `Column` or `Row`:

```dart
// Column cross-axis
Column(children: [...]).crossStart
Column(children: [...]).crossCenter
Column(children: [...]).crossEnd
Column(children: [...]).crossStretch

// Column main-axis
Column(children: [...]).mainStart
Column(children: [...]).mainCenter
Column(children: [...]).mainEnd
Column(children: [...]).mainSpaceBetween
Column(children: [...]).mainSpaceAround
Column(children: [...]).mainSpaceEvenly

// Row cross-axis
Row(children: [...]).crossStart
Row(children: [...]).crossCenter
Row(children: [...]).crossEnd
Row(children: [...]).crossStretch

// Row main-axis
Row(children: [...]).mainStart
Row(children: [...]).mainEnd
Row(children: [...]).mainSpaceBetween
Row(children: [...]).mainSpaceEvenly

// ── Chain them together ──
Column(children: [...]).crossCenter.mainSpaceBetween
Row(children: [...]).mainEnd.crossStretch
```

---

## Navigation Extensions

All navigation shortcuts are available directly on `BuildContext`:

```dart
// ── Basic Navigation ──
context.pushPage(DetailPage())
context.pop()
context.pop(result)  // pop with result

// ── Replacement ──
context.pushReplacementPage(HomePage())

// ── Clear Stack ──
context.pushAndRemoveUntilPage(LoginPage())  // removes all routes
context.pushAndRemoveUntilPage(
  HomePage(),
  predicate: (route) => route.isFirst,       // custom predicate
)

// ── Named Routes ──
context.pushNamed('/detail', arguments: {'id': 42})
context.pushReplacementNamed('/home')

// ── With Transitions ──
context.pushPage(
  ProfilePage(),
  transitionBuilder: RouteTransitions.fadeIn(),
  transitionDuration: Duration(milliseconds: 400),
)

context.pushReplacementPage(
  HomePage(),
  transitionBuilder: RouteTransitions.slideFromBottom(),
)

// ── Fullscreen Dialog ──
context.pushPage(SettingsPage(), fullscreenDialog: true)

// ── Navigator accessor ──
context.navigator  // Navigator.of(context)
```

---

## Route Transitions

`RouteTransitions` provides 17+ ready-to-use transition builders:

```dart
// ── Basic ──
RouteTransitions.fadeIn()                // fade in
RouteTransitions.slide()                 // slide from right (default)
RouteTransitions.scale()                 // zoom
RouteTransitions.rotation()              // rotate

// ── Directional Slides ──
RouteTransitions.slideFromTop()
RouteTransitions.slideFromBottom()
RouteTransitions.slideFromLeft()
RouteTransitions.slideFromRight()

// ── Size ──
RouteTransitions.size()                  // expand vertically
RouteTransitions.size(axis: Axis.horizontal) // expand horizontally

// ── Combined ──
RouteTransitions.fadeScale()             // fade + scale
RouteTransitions.fadeSlide()             // fade + slide from bottom
RouteTransitions.fadeRotate()            // fade + rotate
RouteTransitions.scaleRotate()           // scale + rotate
RouteTransitions.slideScale()            // slide + scale

// ── 3D Flip ──
RouteTransitions.flipX()                 // flip around X axis
RouteTransitions.flipY()                 // flip around Y axis

// ── Presets ──
RouteTransitions.zoomIn()                // fast zoom in
RouteTransitions.zoomOut()               // zoom out
RouteTransitions.bounceIn()              // bounce effect
RouteTransitions.elasticIn()             // elastic spring

// ── Custom curve ──
RouteTransitions.fadeIn(curve: Curves.easeInOutCubic)
RouteTransitions.slide(begin: Offset(0.5, 0.5), curve: Curves.bounceOut)
```

**Usage with navigation:**

```dart
context.pushPage(
  DetailPage(),
  transitionBuilder: RouteTransitions.fadeScale(),
  transitionDuration: Duration(milliseconds: 500),
);
```

---

## Log Extensions

Debug logging shortcuts on `String`:

```dart
'User logged in'.debugLog()               // debugPrint
'Loading data'.infoLog()                  // log level 800 (INFO)
'Cache miss'.warningLog()                 // log level 900 (WARNING)
'Connection failed'.errorLog()            // log level 1000 (ERROR)

// Custom log name
'Data fetched'.infoLog(name: 'API')       // [API] Data fetched
'Timeout'.errorLog(name: 'NETWORK')       // [NETWORK] Timeout
```

---

## Wonzy Widget Namespace

v2.0.0 itibarıyla tüm widget'lara `Wonzy` namespace'i üzerinden erişilir.

```dart
import 'package:wonzy_core_utils/wonzy_core_utils.dart';
```

### Wonzy.appBar

`PreferredSizeWidget` döndürür — `Scaffold.appBar:` ile doğrudan uyumlu:

```dart
Scaffold(
  appBar: Wonzy.appBar(
    // Başlık
    title: 'Ana Sayfa',
    titleWidget: CustomTitleWidget(),       // title yerine geçer
    titleStyle: TextStyle(fontSize: 20),
    titleColor: Colors.white,
    titleFontSize: 18,
    titleFontWeight: FontWeight.bold,
    centerTitle: true,

    // Geri butonu
    leadingIcon: Icons.menu,
    leadingIconColor: Colors.white,
    leadingIconSize: 24,
    onLeadingPressed: () => openDrawer(),
    leading: CustomWidget(),                // leadingIcon yerine geçer
    automaticallyImplyLeading: true,

    // Eylemler
    actions: [
      Wonzy.button.icon(iconData: Icons.search, onPressed: () {}),
      Wonzy.button.icon(iconData: Icons.more_vert, onPressed: () {}),
    ],

    // Görünüm
    backgroundColor: Colors.indigo,
    gradient: LinearGradient(colors: [Colors.indigo, Colors.purple]),
    elevation: 4,
    shadowColor: Colors.black26,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    borderRadius: 16,                       // alt köşeler için kısayol

    // Alt bileşen (TabBar vb.)
    bottom: TabBar(tabs: [...]),

    // Durum çubuğu
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
)
```

### Wonzy.button.standard

Yükleme durumu, gradient ve tam özelleştirme destekli genel amaçlı buton:

```dart
Wonzy.button.standard(
  text: 'Giriş Yap',
  onPressed: () => signIn(),
  onLongPress: () => showOptions(),

  // İkon
  iconData: Icons.login,
  iconSize: 20,
  iconColor: Colors.white,
  iconSpacing: 8,

  // Boyut
  width: double.infinity,
  height: 48,
  padding: EdgeInsets.symmetric(horizontal: 24),
  borderRadius: 12,

  // Renkler
  backgroundColor: Colors.indigo,
  foregroundColor: Colors.white,
  disabledBackgroundColor: Colors.grey,

  // Yükleme durumu
  isLoading: _isLoading,
  loadingColor: Colors.white,
  loadingSize: 20,

  // Devre dışı
  isDisabled: false,

  // Gradient
  gradient: LinearGradient(colors: [Colors.indigo, Colors.purple]),

  // Kenarlık
  borderColor: Colors.indigoAccent,
  borderWidth: 2,

  // Yükseklik (elevation)
  elevation: 4,

  // İpucu
  tooltip: 'Hesabınıza giriş yapın',
)
```

### Wonzy.button.icon

Rozet desteği olan dairesel ikon butonu:

```dart
Wonzy.button.icon(
  iconData: Icons.notifications,
  onPressed: () => showNotifications(),
  size: 48,
  backgroundColor: Colors.indigo,
  foregroundColor: Colors.white,
  borderColor: Colors.white,
  borderWidth: 2,
  elevation: 4,

  // Rozet
  badgeCount: 5,
  badgeColor: Colors.red,
  badgeTextColor: Colors.white,
  showBadge: true,

  // Yükleme / devre dışı
  isLoading: false,
  isDisabled: false,

  // Gradient
  gradient: RadialGradient(colors: [Colors.indigo, Colors.purple]),
)
```

### Wonzy.bottomSheet / Wonzy.bottomSheet.show

Özellik açısından zengin bottom sheet — widget olarak veya modal olarak kullanılabilir:

```dart
// ── Modal göster ──
await Wonzy.bottomSheet.show(
  context,
  title: 'Filtre Seçenekleri',
  subtitle: 'Tercihlerinizi seçin',
  child: FilterWidget(),

  // Tutamaç
  showHandle: true,
  handleColor: Colors.grey,

  // Kapat butonu
  showCloseButton: true,

  // Eylemler
  primaryActionText: 'Uygula',
  onPrimaryAction: () => applyFilter(),
  secondaryActionText: 'Sıfırla',
  onSecondaryAction: () => resetFilter(),

  // Görünüm
  backgroundColor: Colors.white,
  borderRadius: 20,
  elevation: 8,

  // Boyut
  maxHeight: 0.8,  // ekranın %80'i
  padding: EdgeInsets.all(16),

  // Davranış
  isDismissible: true,
  enableDrag: true,
  isDraggable: true,
  useSafeArea: true,

  // Sürüklenebilir seçenekler
  initialChildSize: 0.5,
  minChildSize: 0.25,
  maxChildSize: 0.9,
  snap: true,

  // Kaydırma
  isScrollable: true,
);

// ── Widget olarak (builder içinde) ──
Wonzy.bottomSheet(
  title: 'Seçenekler',
  children: [
    ListTile(title: Text('Seçenek 1')),
    ListTile(title: Text('Seçenek 2')),
  ],
  footer: Wonzy.button.standard(text: 'Tamam', onPressed: () {}),
)
```

### Wonzy.textField

A **production-ready, type-driven smart text field** built on top of `FormBuilderTextField`. Select a `CustomFieldType` and the widget automatically configures keyboard type, autofill hints, obscure mode, and validation rules — all with Turkish error messages by default.

> **Requires:** `flutter_form_builder` and `form_builder_validators` (already included as transitive dependencies).

#### CustomFieldType Enum

| Type            | Keyboard          | Autofill           | Obscure | Default Min Length |
|-----------------|-------------------|--------------------|---------|-------------------|
| `text`          | text              | —                  | false   | —                 |
| `email`         | emailAddress      | email              | false   | —                 |
| `phone`         | phone             | telephoneNumber    | false   | —                 |
| `password`      | visiblePassword   | password           | true    | 6                 |
| `number`        | number            | —                  | false   | —                 |
| `studentNumber` | number            | —                  | false   | 6                 |

#### Temel Kullanım

```dart
// Basit metin alanı
Wonzy.textField(
  name: 'username',
  label: 'Kullanıcı Adı',
  hint: 'Kullanıcı adınızı girin',
  required: true,
)

// E-posta — otomatik klavye, otomatik doldurma ve doğrulama
Wonzy.textField(
  name: 'email',
  type: CustomFieldType.email,
  label: 'E-posta',
  required: true,
)

// Şifre — gizleme, göster/gizle ikonu, min 6 karakter
Wonzy.textField(
  name: 'password',
  type: CustomFieldType.password,
  label: 'Şifre',
  required: true,
)

// Telefon — sayısal klavye, telefon otodoldurma
Wonzy.textField(
  name: 'phone',
  type: CustomFieldType.phone,
  label: 'Telefon',
  required: true,
)

// Sayı — sayısal klavye ve doğrulama
Wonzy.textField(
  name: 'age',
  type: CustomFieldType.number,
  label: 'Yaş',
)

// Öğrenci numarası — sayısal, min 6 karakter
Wonzy.textField(
  name: 'student_no',
  type: CustomFieldType.studentNumber,
  label: 'Öğrenci No',
  required: true,
)
```

#### Şifre Göster/Gizle & Temizle Butonu

```dart
// Şifre alanı (göster/gizle varsayılan olarak etkin)
Wonzy.textField(
  name: 'password',
  type: CustomFieldType.password,
  label: 'Şifre',
  showPasswordToggle: true,   // 👁 geçiş ikonu (varsayılan: true)
)

// Temizle butonu (controller gerektirir)
final _controller = TextEditingController();

Wonzy.textField(
  name: 'search',
  label: 'Ara',
  controller: _controller,
  showClearButton: true,       // ✕ metin varken temizleme ikonu
)
```

#### Odak Yönetimi & Gönderim Akışı

```dart
final _emailFocus = FocusNode();
final _passwordFocus = FocusNode();

// E-posta → Şifre otomatik odaklanma
Wonzy.textField(
  name: 'email',
  type: CustomFieldType.email,
  label: 'E-posta',
  focusNode: _emailFocus,
  nextFocusNode: _passwordFocus,  // "İleri" bas → odak buraya geçer
)

Wonzy.textField(
  name: 'password',
  type: CustomFieldType.password,
  label: 'Şifre',
  focusNode: _passwordFocus,
  onSubmitted: (_) => _submit(),  // "Tamam" bas → formu gönder
)
```

#### Doğrulama & Özel Hata Mesajları

```dart
Wonzy.textField(
  name: 'email',
  type: CustomFieldType.email,
  label: 'E-posta',
  required: true,
  requiredMessage: 'E-posta adresi gereklidir',
  invalidEmailMessage: 'Lütfen geçerli bir e-posta girin',
)

// Min/max uzunluk doğrulaması
Wonzy.textField(
  name: 'bio',
  label: 'Biyografi',
  minLength: 10,
  maxLengthValidator: 200,
  maxLength: 200,
  showCounter: true,
  maxLines: 5,
  minLengthMessage: 'En az 10 karakter yazmalısınız',
  maxLengthMessage: 'En fazla 200 karakter olabilir',
)

// Özel doğrulayıcı
Wonzy.textField(
  name: 'code',
  label: 'Davet Kodu',
  customValidator: (value) {
    if (value != null && !value.startsWith('INV-')) {
      return 'Kod "INV-" ile başlamalıdır';
    }
    return null;
  },
)
```

#### Değer Dönüşümü

```dart
Wonzy.textField(
  name: 'email',
  type: CustomFieldType.email,
  label: 'E-posta',
  transform: (value) => value?.trim().toLowerCase(),
)
```

#### Görünüm Özelleştirme

```dart
Wonzy.textField(
  name: 'note',
  label: 'Not',
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.indigo, width: 2),
  ),
  style: TextStyle(fontSize: 16),
  labelStyle: TextStyle(color: Colors.grey),
)

// Tam decoration geçersizleştirme
Wonzy.textField(
  name: 'custom',
  decoration: InputDecoration(
    labelText: 'Tam Özel',
    filled: true,
    fillColor: Colors.grey.shade100,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  ),
)
```

#### İkonlar

```dart
Wonzy.textField(
  name: 'email',
  type: CustomFieldType.email,
  label: 'E-posta',
  prefixIcon: Icon(Icons.email_outlined),
  suffixIcon: Icon(Icons.check_circle, color: Colors.green),
)
```

#### Tam Form Örneği

```dart
final _formKey = GlobalKey<FormBuilderState>();
final _passwordFocus = FocusNode();
final _searchController = TextEditingController();

FormBuilder(
  key: _formKey,
  child: Column(
    children: [
      Wonzy.textField(
        name: 'email',
        type: CustomFieldType.email,
        label: 'E-posta',
        prefixIcon: Icon(Icons.email_outlined),
        required: true,
        nextFocusNode: _passwordFocus,
        transform: (v) => v?.trim().toLowerCase(),
      ),
      SizedBox(height: 16),
      Wonzy.textField(
        name: 'password',
        type: CustomFieldType.password,
        label: 'Şifre',
        prefixIcon: Icon(Icons.lock_outline),
        required: true,
        focusNode: _passwordFocus,
        minLength: 8,
      ),
      SizedBox(height: 16),
      Wonzy.textField(
        name: 'phone',
        type: CustomFieldType.phone,
        label: 'Telefon',
        prefixIcon: Icon(Icons.phone_outlined),
      ),
      SizedBox(height: 24),
      Wonzy.button.standard(
        text: 'Giriş Yap',
        width: double.infinity,
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            final data = _formKey.currentState!.value;
            print(data); // {email: ..., password: ..., phone: ...}
          }
        },
        child: Text('Giriş Yap'),
      ),
    ],
  ),
)
```

#### All Parameters

| Parameter             | Type                          | Default                        | Description                                      |
|-----------------------|-------------------------------|--------------------------------|--------------------------------------------------|
| `name` *             | `String`                      | —                              | FormBuilder field name (required)                |
| `type`                | `CustomFieldType`             | `.text`                        | Field type — drives defaults                     |
| `label`               | `String?`                     | `null`                         | Label text                                       |
| `hint`                | `String?`                     | `null`                         | Hint text                                        |
| `helperText`          | `String?`                     | `null`                         | Helper text below the field                      |
| `initialValue`        | `String?`                     | `null`                         | Initial value                                    |
| `controller`          | `TextEditingController?`      | `null`                         | External text controller                         |
| `focusNode`           | `FocusNode?`                  | `null`                         | External focus node                              |
| `nextFocusNode`       | `FocusNode?`                  | `null`                         | Focus moves here on submit                       |
| `enabled`             | `bool`                        | `true`                         | Whether the field is enabled                     |
| `readOnly`            | `bool`                        | `false`                        | Read-only mode                                   |
| `autofocus`           | `bool`                        | `false`                        | Auto-focus on build                              |
| `obscureText`         | `bool?`                       | `null` (type default)          | Obscure text override                            |
| `enableSuggestions`   | `bool`                        | `true`                         | Keyboard suggestions                             |
| `autocorrect`         | `bool`                        | `true`                         | Auto-correct                                     |
| `maxLength`           | `int?`                        | `null`                         | Max character count (with counter)               |
| `maxLines`            | `int`                         | `1`                            | Max lines                                        |
| `minLines`            | `int?`                        | `null`                         | Min lines                                        |
| `keyboardType`        | `TextInputType?`              | `null` (type default)          | Keyboard type override                           |
| `textInputAction`     | `TextInputAction?`            | `null` (auto: next/done)       | Keyboard action button                           |
| `inputFormatters`     | `List<TextInputFormatter>?`   | `null`                         | Input formatters                                 |
| `autofillHints`       | `Iterable<String>?`           | `null` (type default)          | Autofill hints override                          |
| `showCounter`         | `bool`                        | `false`                        | Show character counter                           |
| `showClearButton`     | `bool`                        | `false`                        | Show clear (×) icon (needs controller)           |
| `showPasswordToggle`  | `bool`                        | `true`                         | Show password toggle (password type only)        |
| `prefixIcon`          | `Widget?`                     | `null`                         | Leading icon                                     |
| `suffixIcon`          | `Widget?`                     | `null`                         | Trailing icon (combined with toggle/clear)       |
| `onTap`               | `VoidCallback?`               | `null`                         | On tap callback                                  |
| `onChanged`           | `ValueChanged<String?>?`      | `null`                         | On change callback                               |
| `onSubmitted`         | `ValueChanged<String?>?`      | `null`                         | On submit callback                               |
| `transform`           | `String? Function(String?)?`  | `null`                         | Value transformer before save                    |
| `autovalidateMode`    | `AutovalidateMode`            | `.onUserInteraction`           | Validation trigger mode                          |
| `required`            | `bool`                        | `false`                        | Required field rule                              |
| `minLength`           | `int?`                        | `null` (type default)          | Min length validation                            |
| `maxLengthValidator`  | `int?`                        | `null`                         | Max length validation                            |
| `customValidator`     | `FormFieldValidator<String>?` | `null`                         | Custom validator (appended last)                 |
| `requiredMessage`     | `String?`                     | `'Bu alan zorunludur'`         | Required error override                          |
| `invalidEmailMessage` | `String?`                     | `'Geçerli bir e-posta...'`    | Email error override                             |
| `invalidPhoneMessage` | `String?`                     | `'Geçerli bir telefon...'`    | Phone error override                             |
| `minLengthMessage`    | `String?`                     | `'En az N karakter...'`       | Min length error override                        |
| `maxLengthMessage`    | `String?`                     | `'En fazla N karakter...'`    | Max length error override                        |
| `numericMessage`      | `String?`                     | `'Sadece rakam girin'`        | Numeric error override                           |
| `decoration`          | `InputDecoration?`            | `null`                         | Full decoration override                         |
| `contentPadding`      | `EdgeInsetsGeometry?`         | `null`                         | Content padding                                  |
| `border`              | `InputBorder?`                | `null`                         | Default border                                   |
| `enabledBorder`       | `InputBorder?`                | `null`                         | Enabled border                                   |
| `focusedBorder`       | `InputBorder?`                | `null`                         | Focused border                                   |
| `errorBorder`         | `InputBorder?`                | `null`                         | Error border                                     |
| `style`               | `TextStyle?`                  | `null`                         | Field text style                                 |
| `labelStyle`          | `TextStyle?`                  | `null`                         | Label style                                      |
| `hintStyle`           | `TextStyle?`                  | `null`                         | Hint style                                       |

---

## Full Export Tree

Tüm public API tek bir barrel dosyası üzerinden sunulur — `import 'package:wonzy_core_utils/wonzy_core_utils.dart';`

```
lib/wonzy_core_utils.dart
│
├── lib/core_utils.dart  (Extension barrel)
│   │
│   ├── Context Extensions
│   │   └── ContextExtension on BuildContext
│   │       (screenSize, width, height, theme, colorScheme, textTheme,
│   │        primaryColor, secondaryColor, ..., appBarTheme, cardTheme, ...)
│   │
│   ├── Layout Extensions
│   │   ├── ColumnCrossAxis / ColumnMainAxis on Column
│   │   │   (.crossStart, .crossCenter, .mainSpaceBetween, ...)
│   │   ├── RowCrossAxis / RowMainAxis on Row
│   │   │   (.crossStart, .mainEnd, .mainSpaceEvenly, ...)
│   │   ├── ColumnExtension on List<Widget>
│   │   │   (.column(spacing: ...))
│   │   └── RowExtension on List<Widget>
│   │       (.row(spacing: ...))
│   │
│   ├── Navigation Extensions
│   │   ├── NavigatorExtensions on BuildContext
│   │   │   (.pushPage, .pop, .pushReplacementPage, .pushAndRemoveUntilPage,
│   │   │    .pushNamed, .pushReplacementNamed)
│   │   └── RouteTransitions (static class)
│   │       (.fadeIn, .slide, .slideFromTop, .slideFromBottom, .scale,
│   │        .rotation, .size, .fadeScale, .fadeSlide, .fadeRotate,
│   │        .scaleRotate, .flipX, .flipY, .zoomIn, .zoomOut,
│   │        .bounceIn, .elasticIn, .slideScale)
│   │
│   ├── Primitive Extensions
│   │   ├── SizeExtensions on num
│   │   │   (.h, .w, .height, .width, .all, .horizontal, .vertical,
│   │   │    .radius, .ms, .seconds)
│   │   ├── StringExtensions on String
│   │   │   (.capitalize, .toTitleCase, .toSnakeCase, .toKebabCase,
│   │   │    .toCamelCase, .isNumeric, .isAlphabetic, .isAlphanumeric,
│   │   │    .reversed, .ellipsis, .containsIgnoreCase, .stripHtml,
│   │   │    .toBool, .toTurkishPhoneFormat, .toUsername, .toGmail, ...)
│   │   └── TextBuilderExtension on String
│   │       (.text → TextBuilder chainable API)
│   │
│   ├── Utility Extensions
│   │   └── LogExtensions on String
│   │       (.debugLog, .infoLog, .warningLog, .errorLog)
│   │
│   └── Widget Extensions
│       ├── PaddingExtensions on Widget
│       │   (.paddingAll, .paddingHorizontal, .paddingVertical,
│       │    .paddingSymmetric, .paddingOnly, .padding,
│       │    .marginAll, .marginHorizontal, .marginVertical, .marginOnly)
│       ├── AlignmentExtensions on Widget
│       │   (.center, .alignLeft, .alignRight, .alignTop, .alignBottom, .align)
│       ├── ContainerExtensions on Widget
│       │   (.container(...))
│       ├── FlexExtensions on Widget
│       │   (.expanded, .flexible)
│       ├── SizeConstraintExtensions on Widget
│       │   (.sized, .square, .expandedWidth, .expandedHeight, .constrained)
│       ├── WidgetDecorationExtensions on Widget
│       │   (.roundedBox, .withBackground, .withShadow, .asCard,
│       │    .onTap, .onInkTap, .onLongPress, .withVisibility, .withOpacity,
│       │    .rotated, .scaled, .translated, .withTooltip, .asHero,
│       │    .withAspectRatio, .safeArea, .ignorePointer, .absorbPointer,
│       │    .clipRect, .clipOval, .clipRounded, .asCircle, .withBorder)
│       └── ImageExtensions on Image
│           (.rounded, .circular, .bordered, .circleAvatar, .shadow,
│            .colorFiltered, .grayscale, .sepia, .opacity, .blurred,
│            .sized, .ratio, .gradientOverlay, .colorOverlay, .fadeIn)
│
│       String → Image Extensions
│       ├── StringImageExtensions on String
│       │   (.asAssetImage, .asNetworkImage, .asSmartNetworkImage,
│       │    .toAssetImageProvider, .toNetworkImageProvider,
│       │    .asDecorationImage, .asNetworkDecorationImage)
│       └── ImageProviderExtensions on ImageProvider
│           (.toImage, .toDecorationImage, .toCircleAvatar, .toInk)
│
└── lib/src/wonzy.dart  (Wonzy Namespace)
    ├── Wonzy (final class — namespace)
    │   (.appBar, .button, .bottomSheet, .textField)
    │
    ├── Wonzy.appBar(...)         → PreferredSizeWidget
    ├── Wonzy.button.standard(...)→ ElevatedButton tarzı buton
    ├── Wonzy.button.icon(...)    → Rozet destekli ikon buton
    ├── Wonzy.bottomSheet(...)    → CustomBottomSheet widget'ı
    ├── Wonzy.bottomSheet.show(...)→ Future<T?> modal
    ├── Wonzy.textField(...)      → Form entegreli metin alanı
    └── CustomFieldType           (enum — dışa aktarılır)
```

---

## Requirements

| Requirement | Version |
|---|---|
| **Dart SDK** | `^3.11.0` |
| **Flutter** | `>=3.29.0` |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
