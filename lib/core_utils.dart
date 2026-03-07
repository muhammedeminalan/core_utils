/// wonzy_core_utils — Extension'lar katmanı.
///
/// Yalnızca extension dosyalarını dışarı açar.
/// Widget'lara erişmek için `Wonzy` namespace'ini kullanın:
/// ```dart
/// import 'package:wonzy_core_utils/wonzy_core_utils.dart';
///
/// Wonzy.button.standard(text: 'Giriş')
/// Wonzy.appBar(title: 'Ana Sayfa')
/// ```
library;

// ── Context Extensions ──
export 'src/extensions/context/context_extensions.dart';
// ── Layout Extensions ──
export 'src/extensions/layout/axis_extensions.dart';
export 'src/extensions/layout/colum_extensions.dart';
export 'src/extensions/layout/row_extensions.dart';
// ── Navigation Extensions ──
export 'src/extensions/navigation/navigator_extensions.dart';
export 'src/extensions/navigation/transitions/route_transitions.dart';
// ── Primitive Extensions ──
export 'src/extensions/primitive/num_extensions.dart';
export 'src/extensions/primitive/string_extensions.dart';
export 'src/extensions/primitive/text_extensions.dart';
// ── Utility Extensions ──
export 'src/extensions/utility/log_extensions.dart';
// ── Widget Extensions ──
export 'src/extensions/widget/center_extensions.dart';
export 'src/extensions/widget/container_extensions.dart';
export 'src/extensions/widget/expanded_extensions.dart';
export 'src/extensions/widget/images_extensions.dart';
export 'src/extensions/widget/paddings_extensions.dart';
export 'src/extensions/widget/sizebox_extensions.dart';
export 'src/extensions/widget/widget_extensions.dart';

// ── Widget sınıfları artık Wonzy namespace'i üzerinden erişilir ──
// Doğrudan export kaldırıldı (v2.0.0 breaking change).
// Kullanım: Wonzy.button / Wonzy.appBar / Wonzy.bottomSheet / Wonzy.textField
