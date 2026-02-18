import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SizeExtensions (num)', () {
    test('.h creates vertical SizedBox', () {
      final widget = 16.h;
      expect(widget, isA<SizedBox>());
      expect((widget).height, 16.0);
    });

    test('.w creates horizontal SizedBox', () {
      final widget = 24.w;
      expect(widget, isA<SizedBox>());
      expect((widget).width, 24.0);
    });

    test('.all creates EdgeInsets.all', () {
      final insets = 12.all;
      expect(insets, const EdgeInsets.all(12));
    });

    test('.horizontal creates symmetric horizontal EdgeInsets', () {
      final insets = 16.horizontal;
      expect(insets, const EdgeInsets.symmetric(horizontal: 16));
    });

    test('.vertical creates symmetric vertical EdgeInsets', () {
      final insets = 8.vertical;
      expect(insets, const EdgeInsets.symmetric(vertical: 8));
    });

    test('.radius creates BorderRadius.circular', () {
      final radius = 10.radius;
      expect(radius, BorderRadius.circular(10));
    });

    test('.ms creates millisecond Duration', () {
      final duration = 300.ms;
      expect(duration, const Duration(milliseconds: 300));
    });

    test('.seconds creates second Duration', () {
      final duration = 2.seconds;
      expect(duration, const Duration(seconds: 2));
    });
  });
}
