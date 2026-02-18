# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
