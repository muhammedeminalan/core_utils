// ─────────────────────────────────────────────────────────────
// Compile-time RegExp sabitleri — her çağrıda yeniden derlenmez.
// ─────────────────────────────────────────────────────────────
final RegExp _nonDigitRe = RegExp(r'\D');
final RegExp _alphaRe = RegExp(r'^[a-zA-Z]+$');
final RegExp _alphanumericRe = RegExp(r'^[a-zA-Z0-9]+$');
final RegExp _hasDigitRe = RegExp(r'\d');
final RegExp _hasLetterRe = RegExp(r'[a-zA-Z]');
final RegExp _htmlTagRe = RegExp(r'<[^>]*>');

extension StringExtensions on String {
  String toTurkishPhoneFormat() {
    // Sayıları temizle
    String digits = replaceAll(_nonDigitRe, '');

    // Türkiye cep telefonu 10 hane (0 ile başlayan kısmı)
    if (digits.length > 10) {
      digits = digits.substring(digits.length - 10); // son 10 hane al
    }
    if (digits.isEmpty) return '';

    String formatted = '';
    if (digits.length <= 3) {
      formatted = '0$digits';
    } else if (digits.length <= 6) {
      formatted = '0${digits.substring(0, 3)} ${digits.substring(3)}';
    } else {
      formatted =
          '0${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    }

    return '+90 $formatted';
  }

  String toUsername() {
    final String trimmed = trim(); // boşlukları temizle
    if (trimmed.isEmpty) return '';
    if (trimmed.startsWith('@')) return trimmed;
    return '@$trimmed';
  }

  String toGmail() {
    final String trimmed = trim();

    if (trimmed.isEmpty) return '';

    // Eğer zaten @gmail.com ile bitiyorsa ekleme
    if (trimmed.toLowerCase().endsWith('@gmail.com')) {
      return trimmed.toLowerCase();
    }

    return '${trimmed.toLowerCase()}@gmail.com';
  }

  /// İlk harfi büyük yapar: "merhaba" -> "Merhaba"
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Tüm harfleri küçük yapar.
  ///
  /// @deprecated Doğrudan [toLowerCase] kullanın — non-nullable String'de
  /// "safe" wrapper gereksizdir.
  @Deprecated('Use toLowerCase() directly.')
  String toLowerCaseSafe() => toLowerCase();

  /// Tüm harfleri büyük yapar.
  ///
  /// @deprecated Doğrudan [toUpperCase] kullanın.
  @Deprecated('Use toUpperCase() directly.')
  String toUpperCaseSafe() => toUpperCase();

  /// Her kelimenin ilk harfini büyük yapar: "merhaba flutter" -> "Merhaba Flutter"
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ')
        .map(
          (word) =>
              word.isEmpty ? word : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }

  /// Tüm harfleri küçük yapar ve aradaki boşlukları "_" ile değiştirir
  String toSnakeCase() => trim().toLowerCase().replaceAll(' ', '_');

  /// Tüm harfleri küçük yapar ve aradaki boşlukları "-" ile değiştirir
  String toKebabCase() => trim().toLowerCase().replaceAll(' ', '-');

  /// CamelCase formatına çevirir: "merhaba flutter" -> "merhabaFlutter"
  String toCamelCase() {
    final words = split(' ');
    if (words.isEmpty) return '';
    return words.first.toLowerCase() +
        words.skip(1).map((w) => w.capitalize()).join();
  }

  /// Başındaki ve sonundaki boşlukları temizler
  String get trimmed => trim();

  /// String boş mu kontrol eder.
  ///
  /// @deprecated Non-nullable String üzerinde `null` kontrolü anlamsızdır;
  /// doğrudan [isEmpty] kullanın.
  @Deprecated('Use isEmpty directly. String is non-nullable.')
  bool get isNullOrEmpty => isEmpty;

  /// String boş değil mi kontrol eder.
  ///
  /// @deprecated Doğrudan [isNotEmpty] kullanın.
  @Deprecated('Use isNotEmpty directly. String is non-nullable.')
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Belirli bir uzunluktan sonra "..." ekler
  String ellipsis(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// String'i ters çevirir: "abc" -> "cba"
  String get reversed => split('').reversed.join();

  /// Belirli bir substring içeriyor mu? (büyük/küçük harf duyarsız)
  bool containsIgnoreCase(String value) =>
      toLowerCase().contains(value.toLowerCase());

  /// String sadece rakamlardan mı oluşuyor
  bool get isNumeric => double.tryParse(this) != null;

  /// String sadece harflerden mi oluşuyor
  bool get isAlphabetic => _alphaRe.hasMatch(this);

  /// String sadece harf veya rakamlardan mı oluşuyor
  bool get isAlphanumeric => _alphanumericRe.hasMatch(this);

  /// String içinde rakam var mı
  bool get hasNumber => _hasDigitRe.hasMatch(this);

  /// String içinde harf var mı
  bool get hasLetter => _hasLetterRe.hasMatch(this);

  /// Başındaki karakterleri tekrarlayıp padding ekler
  String padLeftToLength(int length, [String char = ' ']) =>
      padLeft(length, char);

  /// Sonuna karakter ekler
  String padRightToLength(int length, [String char = ' ']) =>
      padRight(length, char);

  /// Substring değiştirir
  String replaceAllIgnoreCase(String from, String to) =>
      replaceAll(RegExp(from, caseSensitive: false), to);

  /// HTML taglerini temizler
  String get stripHtml => replaceAll(_htmlTagRe, '');

  /// String'i boşluklardan listeye çevirir.
  ///
  /// @deprecated `split(' ')` kullanın; bu wrapper YAGNI ihlalidir.
  @Deprecated("Use split(' ') directly.")
  List<String> get splitToList => split(' ');

  /// String uzunluğu.
  ///
  /// @deprecated Non-nullable String üzerinde gereksizdir; doğrudan [length] kullanın.
  @Deprecated('Use length directly. String is non-nullable.')
  int get lengthSafe => length;

  /// String'in belirli bir index'i varsa döndürür, yoksa default
  String charAtOr(int index, String defaultValue) =>
      (index >= 0 && index < length) ? this[index] : defaultValue;

  /// String'i bool olarak parse eder
  bool get toBool => toLowerCase() == 'true';
}
