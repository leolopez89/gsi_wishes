// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsi_wishes/bloc/app/app_bloc.dart';
import 'package:gsi_wishes/main.dart';
import 'package:gsi_wishes/pages/creation_page.dart';
import 'package:gsi_wishes/pages/home_page.dart';
import 'package:gsi_wishes/pages/users_page.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Check fist page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(WishApp());

    // Verify that start page is user select.
    expect(find.text('Seleccionar el usuario'), findsOneWidget);
    expect(find.byType(UsersPage), findsOneWidget);
  });

  testWidgets('Go to homepage as project manager', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(BlocProvider(
      create: (_) => AppBloc(),
      child: MaterialApp(
        home: UsersPage(),
        navigatorObservers: [mockObserver],
      ),
    ));

    await tester.tap(find.text("Project Manager"));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(CreationPage), findsOneWidget);
  });

    testWidgets('Go to homepage as group manager', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(BlocProvider(
      create: (_) => AppBloc(),
      child: MaterialApp(
        home: UsersPage(),
        navigatorObservers: [mockObserver],
      ),
    ));

    await tester.tap(find.text("Group Manager"));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNothing);
  });

  testWidgets('Check members count', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(WishApp());

    expect(find.textContaining('Member'), findsNWidgets(2));
  });

}
