import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_explorer_flutter/core/configs/app_theme.dart';

void main() {
  group('getRatingColor', () {
    test('returns green for rating >= 7', () {
      expect(getRatingColor(7), const Color(0xFF27AE60));
    });

    test('returns amber for rating >= 5 and < 7', () {
      expect(getRatingColor(5), const Color(0xFFF39C12));
    });

    test('returns red for rating < 5', () {
      expect(getRatingColor(4.9), const Color(0xFFE50914));
    });
  });
}
