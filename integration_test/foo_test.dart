import 'package:firebase_practice/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Sign in test example", (WidgetTester tester) async {
    final Finder signInEmailField = find.byKey(Key('signInEmailField'));
    final Finder signInPasswordField = find.byKey(Key('signInPasswordField'));
    final Finder signInSaveButton = find.byKey(Key('signInSaveButton'));

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('signInEmailField')));
    await tester.enterText(signInEmailField, "paras@gmail.com");

    await tester.tap(signInPasswordField);
    await tester.enterText(signInPasswordField, "123456");

    await tester.tap(signInSaveButton);
    print("button tapped");
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(
        find.byWidgetPredicate((widget) =>
            widget is AppBar &&
            widget.title is Text &&
            (widget.title as Text).data.startsWith("ToDoApp")),
        findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 1));
  });
}
