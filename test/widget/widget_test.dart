import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study/login_screen.dart';

void main() {
  group('Login Screen', () {
    testWidgets("Should render all elements in login screen", (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.text('LOGIN'), findsOneWidget);

      expect(find.byType(TextField), findsNWidgets(2));

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('Should navigate to Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.text('LOGIN'), findsOneWidget);

      await tester.tap(find.text('LOGIN'));

      await tester.pumpAndSettle();

      expect(
        find.text('Yeah!! you have entered to Home Screen'),
        findsOneWidget,
      );
    });
  });
}
