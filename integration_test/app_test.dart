import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:study/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration testing', () {
    testWidgets('Should able to enter email and password', (
      WidgetTester tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byType(TextField).at(0), findsOneWidget);
      expect(find.byType(TextField).at(1), findsOneWidget);

      await tester.enterText(
        find.byType(TextField).at(0),
        'adhunvkm7@gmail.com',
      );
      await tester.enterText(find.byType(TextField).at(1), '12345678');

      await tester.tap(find.text('LOGIN'));

      await tester.pumpAndSettle();

      expect(
        find.text('Yeah!! you have entered to Home Screen'),
        findsOneWidget,
      );
      tester.state<NavigatorState>(find.byType(Navigator)).pop();

      await tester.pumpAndSettle();

      expect(find.byType(TextField).at(0), findsOneWidget);
      expect(find.byType(TextField).at(1), findsOneWidget);
    });
  });
}
