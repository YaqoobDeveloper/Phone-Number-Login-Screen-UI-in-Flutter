import 'package:flutter_test/flutter_test.dart';

import 'package:phone_number_login/main.dart';

void main() {
  testWidgets('shows validation errors on empty submit', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Sign in to your Account'), findsOneWidget);

    await tester.tap(find.text('Log In'));
    await tester.pump();

    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
