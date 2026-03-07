/// wonzy_core_utils — Kanonik giriş noktası (v2.0.0+).
///
/// Tüm extension'lar ve `Wonzy` widget namespace'i bu dosyadan açılır.
///
/// ```dart
/// import 'package:wonzy_core_utils/wonzy_core_utils.dart';
///
/// // Widget'lar — Wonzy namespace
/// Wonzy.button.standard(text: 'Giriş Yap', onPressed: _onLogin)
/// Wonzy.button.icon(iconData: Icons.menu, onPressed: _openMenu)
/// Wonzy.appBar(title: 'Ana Sayfa', centerTitle: true)
/// Wonzy.bottomSheet(title: 'Filtre', child: FilterWidget())
/// await Wonzy.bottomSheet.show(context, title: 'Onay', child: ConfirmWidget())
/// Wonzy.textField(name: 'email', type: CustomFieldType.email)
///
/// // Extension'lar
/// context.width          // BuildContext kısayolları
/// 'merhaba'.text.bold    // Metin oluşturucu zinciri
/// 16.h                   // SizedBox boşluk
/// ```
library;

// ── Tüm extension'lar ──
export 'core_utils.dart';
// ── Wonzy widget namespace + CustomFieldType ──
export 'src/wonzy.dart';
