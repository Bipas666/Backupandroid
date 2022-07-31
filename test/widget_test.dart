import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/SinInPage.dart';
import 'package:blogapp/Profile/updateProfile.dart';
import 'package:blogapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    
    await tester.pumpWidget(MyApp());
    final titleFinder =find.text('asfa');
    print(titleFinder);

    // ignore: todo

    // TODO: Implement test

    expect(titleFinder, findsNothing);
  });
}
