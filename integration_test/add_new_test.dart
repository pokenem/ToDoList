import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tdlist/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Creating new task', (tester) async {
    await app.main();

    await waitTime(4);
    await tester.pumpAndSettle();

    expect(find.byType(FloatingActionButton), findsOneWidget);
    await waitTime(3);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), "Hi");

    await tester.tap(find.byType(TextButton).first);

    await tester.pumpAndSettle();
    expect(find.text("Hi").first, findsWidgets);
  });
}

Future<void> waitTime(int seconds) =>
    Future.delayed(Duration(seconds: seconds));
