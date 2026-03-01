# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-03-01

### Breaking (backward-compatible via deprecated aliases)

- **`Costum*` → `Custom*` rename**: `CostumAppBar`, `CostumButton`, `CostumIconButton`,
  `CostumBottomSheet` sınıfları sırasıyla `CustomAppBar`, `CustomButton`, `CustomIconButton`,
  `CustomBottomSheet` olarak yeniden adlandırıldı.
  Eski isimler `@Deprecated` typedef'leri olarak korunmaktadır; bir major versiyonda kaldırılacak.
  **Geçiş:** `Costum` → `Custom` find & replace yeterlidir.

### Added

- `ContextExtension.screenWidth(double size)` — `scrennWidth` yazım hatasının doğru versiyonu.
- `analysis_options.yaml`'a ek strict lint kuralları eklendi:
  `avoid_dynamic_calls`, `unawaited_futures`, `discarded_futures`, `unnecessary_lambdas`.

### Fixed

- **[KRİTİK] `context_extensions.dart`**: `textTheme.displayLarge!` ve diğer 14 TextTheme alanındaki
  `!` null-assertion operatörleri `?? const TextStyle()` fallback'iyle değiştirildi.
  Özelleştirilmiş ThemeData'larda crash riski ortadan kalktı.
- **[KRİTİK] `container_extensions.dart`**: `decoration as BoxDecoration?` unchecked cast kaldırıldı;
  `decoration is BoxDecoration ? decoration : null` güvenli form'a çevrildi.
  `ShapeDecoration` vb. geçildiğinde çıkan `TypeError` engellenmiş oldu.
- **[GÜVENLİK] `log_extensions.dart`**: `infoLog`, `warningLog`, `errorLog` metodlarına
  `kDebugMode` guard eklendi. Release build'de bu metodlar artık hiçbir şey yazmaz;
  hassas veri (token, parola vb.) production loglarına sızmaz.
- **[PERFORMANS] `string_extensions.dart`**: `isAlphabetic`, `isAlphanumeric`, `hasNumber`,
  `hasLetter`, `stripHtml` metodlarındaki inline `RegExp(...)` çağrıları modül seviyesi `final`
  sabitlerle değiştirildi. Her çağrıda yeniden derleme maliyeti ortadan kalktı.

### Deprecated

- `ContextExtension.scrennWidth` — `screenWidth` kullanın.
- `StringExtensions.toLowerCaseSafe()` — doğrudan `toLowerCase()` kullanın.
- `StringExtensions.toUpperCaseSafe()` — doğrudan `toUpperCase()` kullanın.
- `StringExtensions.isNullOrEmpty` — `isEmpty` kullanın.
- `StringExtensions.isNotNullOrEmpty` — `isNotEmpty` kullanın.
- `StringExtensions.lengthSafe` — `length` kullanın.
- `StringExtensions.splitToList` — `split(' ')` kullanın.
- `CostumAppBar` → `CustomAppBar`
- `CostumButton` → `CustomButton`
- `CostumIconButton` → `CustomIconButton`
- `CostumBottomSheet` → `CustomBottomSheet`



### Fixed

- `pubspec.yaml` description length reduced to comply with pub.dev 60-180 character limit.
- Local variables changed to `final` in `string_extensions.dart` (`toUsername`, `toGmail`).
- `Container` replaced with `DecoratedBox` in `images_extensions.dart` (`bordered`, `shadow`).
- `Widget sheet` changed to `final Widget sheet` in `costum_bottom_sheet.dart`.
- Added missing `const` constructors in `layout_extensions_test.dart`.

## [0.2.0] - 2025-02-20

### Added

- **CustomTextField** — Production-ready, type-driven smart text field built on `FormBuilderTextField`.
  - `CustomFieldType` enum (`text`, `email`, `phone`, `password`, `number`, `studentNumber`) with automatic keyboard, autofill, obscure, and validation defaults.
  - Password show/hide toggle icon.
  - Clear (×) button support (with controller).
  - `nextFocusNode` for automatic focus transition on submit.
  - `valueTransformer` for pre-save value transformation (trim, lowercase, etc.).
  - Turkish error messages by default; all overridable.
  - Full `InputDecoration` customization support.
  - Custom validator composition via `FormBuilderValidators.compose`.

### Changed

- Moved `flutter_form_builder` and `form_builder_validators` from `dev_dependencies` to `dependencies` (required by `CustomTextField`).

## [0.1.0] - 2025-02-18

### Added

- **Context Extensions** — `BuildContext` shortcuts for screen size, theme, color scheme, and text theme.
- **Layout Extensions** — `Column`/`Row` cross-axis & main-axis alignment helpers; `List<Widget>.column()` / `.row()` builders with spacing support.
- **Navigation Extensions** — `pushPage`, `pop`, `pushReplacementPage`, `pushAndRemoveUntilPage`, named route shortcuts on `BuildContext`.
- **Route Transitions** — `RouteTransitions` class with fade, slide, scale, rotation, size, and combined transition builders.
- **Primitive Extensions**
  - `num` — `.h`, `.w` (SizedBox spacing), `.all`, `.horizontal`, `.vertical` (EdgeInsets), `.radius` (BorderRadius), `.ms`, `.seconds` (Duration).
  - `String` — `capitalize`, `toTitleCase`, `toSnakeCase`, `toCamelCase`, validators (`isNumeric`, `isAlphabetic`, etc.), `toTurkishPhoneFormat`, `toUsername`, `toGmail`, and more.
  - `TextBuilder` — Chainable text widget builder: `"Hello".text.bold.headline4(context).color(Colors.red)`.
- **Utility Extensions** — `String` logging helpers: `debugLog()`, `infoLog()`, `warningLog()`, `errorLog()`.
- **Widget Extensions**
  - Padding & Margin — `.paddingAll()`, `.paddingHorizontal()`, `.marginAll()`, etc.
  - Alignment — `.center`, `.alignLeft`, `.alignRight`, `.alignTop`, `.alignBottom`.
  - Container — `.container()` all-in-one wrapper.
  - Expanded / Flexible — `.expanded()`, `.flexible()`.
  - Size — `.sized()`, `.square()`, `.expandedWidth`, `.constrained()`.
  - Image — `.rounded()`, `.circular()`, `.bordered()`, `.circleAvatar()`, `.shadow()`, and more.
  - Decoration — `.roundedBox()`, `.withBackground()`, `.onTap()`, `.withVisibility()`, `.withOpacity()`, `.withTooltip()`, `.withHero()`.
- **Reusable Widgets**
  - `CostumAppBar` — Fully customizable AppBar with gradient, shape, bottom separator support.
  - `CostumBottomSheet` — Feature-rich bottom sheet with draggable, scrollable, action buttons support.
  - `CostumButton` — General purpose button with loading state, gradient, icon support.
  - `CostumIconButton` — Circular icon button with badge, gradient, loading state support.
