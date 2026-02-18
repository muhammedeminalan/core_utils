# core_utils

[![CI](https://github.com/muhammedeminalan/core_utils/actions/workflows/ci.yml/badge.svg)](https://github.com/muhammedeminalan/core_utils/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A collection of **Flutter/Dart extensions** and **reusable widgets** for rapid UI development. Write less boilerplate, build faster.

## Features

| Category | What you get |
|---|---|
| **Context** | Screen size, theme, color scheme, text theme shortcuts on `BuildContext` |
| **Layout** | Column/Row axis alignment helpers, `List<Widget>.column()` / `.row()` with spacing |
| **Navigation** | `pushPage`, `pop`, `pushReplacementPage`, named route helpers on `BuildContext` |
| **Transitions** | `RouteTransitions.fadeIn()`, `.slide()`, `.scale()`, `.rotation()` and combined |
| **Primitives** | `num` → spacing/padding/radius/duration; `String` → capitalize, case conversion, validators |
| **Text Builder** | `"Hello".text.bold.headline4(context).color(Colors.red)` — chainable |
| **Widget** | `.paddingAll()`, `.center`, `.expanded()`, `.container()`, `.onTap()`, `.roundedBox()` |
| **Image** | `.rounded()`, `.circular()`, `.circleAvatar()`, `.shadow()`, `.colorFiltered()` |
| **Logging** | `"message".debugLog()`, `.infoLog()`, `.warningLog()`, `.errorLog()` |
| **Widgets** | `CostumAppBar`, `CostumBottomSheet`, `CostumButton`, `CostumIconButton` |

## Installation

### Option A: Git dependency (recommended for now)

```yaml
dependencies:
  core_utils:
    git:
      url: https://github.com/muhammedeminalan/core_utils.git
      ref: v0.1.0
```

### Option B: pub.dev (if/when published)

```yaml
dependencies:
  core_utils: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:core_utils/core_utils.dart';
```

That single import gives you everything. Here are some examples:

### Context Extensions

```dart
// Screen dimensions
final width = context.width;
final height = context.screenHeight(0.5); // 50% of screen height

// Theme shortcuts
final color = context.primaryColor;
final style = context.bodyLarge;
```

### Spacing & Sizing (num)

```dart
// SizedBox shortcuts
16.h   // SizedBox(height: 16)
24.w   // SizedBox(width: 24)

// EdgeInsets
12.all         // EdgeInsets.all(12)
16.horizontal  // EdgeInsets.symmetric(horizontal: 16)

// BorderRadius & Duration
8.radius    // BorderRadius.circular(8)
300.ms      // Duration(milliseconds: 300)
```

### String Extensions

```dart
'hello world'.capitalize();    // "Hello world"
'hello world'.toTitleCase();   // "Hello World"
'hello world'.toSnakeCase();   // "hello_world"
'hello world'.toCamelCase();   // "helloWorld"

'abc123'.isAlphanumeric;       // true
'42'.isNumeric;                // true
'Hello Flutter...'.ellipsis(5); // "Hello..."
```

### Text Builder

```dart
"Welcome".text.bold.titleLarge(context).color(Colors.white)
// Returns a styled Text widget — chainable API
```

### Widget Extensions

```dart
Text('Hello')
    .paddingAll(16)
    .center
    .container(color: Colors.blue, borderRadius: 12)
    .onTap(() => print('tapped!'))

// Image helpers
Image.asset('photo.png')
    .rounded(16)
    .shadow()
    .bordered(color: Colors.white, width: 2)
```

### Layout Helpers

```dart
// List<Widget> → Column/Row with spacing
[Text('A'), Text('B'), Text('C')].column(spacing: 8)
[Icon(Icons.star), Text('Fav')].row(spacing: 4)

// Axis alignment on existing widgets
Column(children: [...]).crossCenter.mainSpaceBetween
Row(children: [...]).mainEnd.crossStretch
```

### Navigation

```dart
// Push with transition
context.pushPage(
  DetailPage(),
  transitionBuilder: RouteTransitions.fadeIn(),
);

// Simple navigation
context.pop();
context.pushReplacementPage(HomePage());
context.pushAndRemoveUntilPage(LoginPage());
```

### Reusable Widgets

```dart
// Custom AppBar
CostumAppBar(
  title: 'Home',
  leadingIcon: Icons.menu,
  backgroundColor: Colors.indigo,
  actions: [CostumIconButton(iconData: Icons.search, onPressed: () {})],
)

// Custom Button with loading state
CostumButton(
  text: 'Submit',
  onPressed: () {},
  isLoading: _loading,
  backgroundColor: Colors.blue,
  borderRadius: 12,
)

// Bottom Sheet
CostumBottomSheet.show(
  context,
  title: 'Filter',
  child: FilterWidget(),
);
```

## Exports

All public API is exposed through a single barrel file:

```
lib/core_utils.dart
├── Context Extensions        (BuildContext → screen size, theme, colors, text styles)
├── Layout Extensions
│   ├── Axis Extensions       (Column/Row cross & main axis helpers)
│   ├── Column Extensions     (List<Widget>.column())
│   └── Row Extensions        (List<Widget>.row())
├── Navigation Extensions     (BuildContext → push, pop, replace)
│   └── Route Transitions     (RouteTransitions static builders)
├── Primitive Extensions
│   ├── num Extensions        (spacing, padding, radius, duration)
│   ├── String Extensions     (capitalize, case, validators, formatters)
│   └── Text Extensions       (TextBuilder chainable API)
├── Utility Extensions        (String logging)
├── Widget Extensions
│   ├── Center/Alignment      (.center, .alignLeft, .align())
│   ├── Container             (.container())
│   ├── Expanded/Flexible     (.expanded(), .flexible())
│   ├── Image                 (.rounded(), .circular(), .shadow(), etc.)
│   ├── Padding/Margin        (.paddingAll(), .marginAll(), etc.)
│   ├── SizedBox/Constraints  (.sized(), .square(), .constrained())
│   └── Widget Decoration     (.roundedBox(), .onTap(), .withOpacity(), etc.)
└── Reusable Widgets
    ├── CostumAppBar
    ├── CostumBottomSheet
    ├── CostumButton
    └── CostumIconButton
```

## Requirements

- **Dart SDK**: `^3.11.0`
- **Flutter**: `>=3.29.0`

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
