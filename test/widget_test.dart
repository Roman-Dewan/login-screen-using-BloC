// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_responsive_login_ui/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our login screen contains specific text.
    expect(find.text('Sign in.'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);

    // Verify no validation errors initially
    expect(find.text('Please enter your email'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);

    // Tap the 'Sign in' button to trigger validation
    // The button has text 'Sign in' (without dot), the title has 'Sign in.' (with dot)
    await tester.tap(find.text('Sign in'));
    await tester.pump();

    // Verify validation errors appear
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
