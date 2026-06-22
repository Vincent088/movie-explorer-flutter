import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_explorer_flutter/widgets/error_message.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('renders the error message', (tester) async {
    await tester.pumpWidget(wrap(const ErrorMessage(message: 'Network error')));
    expect(find.text('Network error'), findsOneWidget);
  });

  testWidgets('renders retry button when onRetry is provided', (tester) async {
    await tester.pumpWidget(wrap(ErrorMessage(message: 'Network error', onRetry: () {})));
    expect(find.text('Retry'), findsOneWidget);
  });

  testWidgets('calls onRetry when retry button is pressed', (tester) async {
    var called = false;
    await tester.pumpWidget(wrap(ErrorMessage(message: 'Network error', onRetry: () => called = true)));
    await tester.tap(find.text('Retry'));
    expect(called, isTrue);
  });

  testWidgets('does not render retry button when onRetry is not provided', (tester) async {
    await tester.pumpWidget(wrap(const ErrorMessage(message: 'Network error')));
    expect(find.text('Retry'), findsNothing);
  });
}
