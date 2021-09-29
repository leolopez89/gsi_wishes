import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsi_wishes/main.dart';
import 'package:gsi_wishes/presentation/users/index.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Check fist page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that start page is user select.
    expect(find.text('Seleccionar el usuario'), findsOneWidget);
    expect(find.byType(UsersPage), findsOneWidget);
  });

  // testWidgets('Go to homepage as project manager', (WidgetTester tester) async {
  //   final mockObserver = MockNavigatorObserver();

  //   await tester.pumpWidget(BlocProvider(
  //     create: (_) => AppBloc(),
  //     child: MaterialApp(
  //       home: UsersPage(),
  //       navigatorObservers: [mockObserver],
  //     ),
  //   ));

  //   await tester.tap(find.text("Project Manager"));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(HomePage), findsOneWidget);
  //   expect(find.byType(FloatingActionButton), findsOneWidget);

  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(CreationPage), findsOneWidget);
  // });

  //   testWidgets('Go to homepage as group manager', (WidgetTester tester) async {
  //   final mockObserver = MockNavigatorObserver();

  //   await tester.pumpWidget(BlocProvider(
  //     create: (_) => AppBloc(),
  //     child: MaterialApp(
  //       home: UsersPage(),
  //       navigatorObservers: [mockObserver],
  //     ),
  //   ));

  //   await tester.tap(find.text("Group Manager"));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(HomePage), findsOneWidget);
  //   expect(find.byType(FloatingActionButton), findsNothing);
  // });

  testWidgets('Check members count', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.textContaining('Member'), findsNWidgets(2));
  });

}
