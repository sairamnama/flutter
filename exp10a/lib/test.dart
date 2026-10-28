 import 'package:flutter/material.dart'; 
import 'package:flutter_test/flutter_test.dart'; 
import 'package:exp10a/main.dart'; 
    void main() { 
      testWidgets('Counter displays initial value', 
          (WidgetTester tester) async { 
        await tester.pumpWidget(const MyApp()); 
        expect(find.text('0'), findsOneWidget); 
      }); 
      testWidgets('Counter increments when button is pressed', 
          (WidgetTester tester) async { 
        await tester.pumpWidget(const MyApp()); 
        await tester.tap(find.byKey(const Key('incrementButton'))); 
        await tester.pump(); 
        expect(find.text('1'), findsOneWidget); 
      }); 
      testWidgets('UI elements are displayed', 
          (WidgetTester tester) async { 
        await tester.pumpWidget(const MyApp()); 
        expect(find.text('Counter App'), findsOneWidget); 
        expect(find.text('Counter Value:'), findsOneWidget); 
        expect(find.text('Increment'), findsOneWidget); 
      }); 
    } 
     
