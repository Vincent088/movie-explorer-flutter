import 'package:flutter_test/flutter_test.dart';
import 'package:movie_explorer_flutter/widgets/movie_grid.dart';

void main() {
  group('getNumColumns', () {
    test('returns 2 columns for narrow phone width', () {
      expect(getNumColumns(360), 2);
    });

    test('returns 3 columns at the 480 breakpoint', () {
      expect(getNumColumns(480), 3);
    });

    test('returns 4 columns at the 600 breakpoint', () {
      expect(getNumColumns(600), 4);
    });

    test('returns 5 columns at the 900 breakpoint', () {
      expect(getNumColumns(900), 5);
    });

    test('returns 6 columns at the 1200 breakpoint', () {
      expect(getNumColumns(1200), 6);
    });
  });
}
