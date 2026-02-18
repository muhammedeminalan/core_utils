import 'package:flutter_test/flutter_test.dart';
import 'package:wonzy_core_utils/core_utils.dart';

void main() {
  group('StringExtensions', () {
    test('capitalize makes first letter uppercase', () {
      expect('hello'.capitalize(), 'Hello');
      expect(''.capitalize(), '');
      expect('a'.capitalize(), 'A');
      expect('Hello'.capitalize(), 'Hello');
    });

    test('toTitleCase capitalizes each word', () {
      expect('hello world'.toTitleCase(), 'Hello World');
      expect('flutter dart'.toTitleCase(), 'Flutter Dart');
      expect(''.toTitleCase(), '');
      expect('a'.toTitleCase(), 'A');
    });

    test('toSnakeCase converts spaces to underscores', () {
      expect('Hello World'.toSnakeCase(), 'hello_world');
      expect(' padded '.toSnakeCase(), 'padded');
    });

    test('toKebabCase converts spaces to dashes', () {
      expect('Hello World'.toKebabCase(), 'hello-world');
    });

    test('toCamelCase converts to camelCase', () {
      expect('hello world'.toCamelCase(), 'helloWorld');
      expect('first second third'.toCamelCase(), 'firstSecondThird');
    });

    test('ellipsis truncates long strings', () {
      expect('Hello Flutter'.ellipsis(5), 'Hello...');
      expect('Hi'.ellipsis(10), 'Hi');
    });

    test('reversed reverses the string', () {
      expect('abc'.reversed, 'cba');
      expect(''.reversed, '');
    });

    test('containsIgnoreCase is case-insensitive', () {
      expect('Hello World'.containsIgnoreCase('hello'), isTrue);
      expect('Hello World'.containsIgnoreCase('WORLD'), isTrue);
      expect('Hello World'.containsIgnoreCase('xyz'), isFalse);
    });

    test('isNumeric detects numeric strings', () {
      expect('123'.isNumeric, isTrue);
      expect('12.5'.isNumeric, isTrue);
      expect('abc'.isNumeric, isFalse);
      expect(''.isNumeric, isFalse);
    });

    test('isAlphabetic detects alphabetic strings', () {
      expect('hello'.isAlphabetic, isTrue);
      expect('hello123'.isAlphabetic, isFalse);
      expect(''.isAlphabetic, isFalse);
    });

    test('isAlphanumeric detects alphanumeric strings', () {
      expect('hello123'.isAlphanumeric, isTrue);
      expect('hello 123'.isAlphanumeric, isFalse);
    });

    test('toBool parses boolean-like strings', () {
      expect('true'.toBool, isTrue);
      expect('TRUE'.toBool, isTrue);
      expect('false'.toBool, isFalse);
      expect('anything'.toBool, isFalse);
    });

    test('stripHtml removes HTML tags', () {
      expect('<b>bold</b>'.stripHtml, 'bold');
      expect('<p>Hello <em>World</em></p>'.stripHtml, 'Hello World');
    });

    test('toTurkishPhoneFormat formats phone numbers', () {
      expect('5551234567'.toTurkishPhoneFormat(), '+90 0555 123 4567');
      expect('05551234567'.toTurkishPhoneFormat(), '+90 0555 123 4567');
    });

    test('toUsername prepends @ sign', () {
      expect('john'.toUsername(), '@john');
      expect('@john'.toUsername(), '@john');
      expect(''.toUsername(), '');
    });

    test('charAtOr returns char at index or default', () {
      expect('abc'.charAtOr(0, 'x'), 'a');
      expect('abc'.charAtOr(5, 'x'), 'x');
      expect('abc'.charAtOr(-1, 'x'), 'x');
    });
  });
}
