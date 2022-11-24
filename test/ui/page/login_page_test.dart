import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:enquetes/ui/pages/pages.dart';
import 'package:get/route_manager.dart';
import 'package:mockito/mockito.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

void main() {
  LoginPresenter presenter;
  StreamController<String> emailErrorController;
  StreamController<String> passwordErrorController;
  StreamController<String> mainErrorController;
  StreamController<String> navigateToController;
  StreamController<bool> isFormValidController;
  StreamController<bool> isLoadingController;
  void initStreams() {
    emailErrorController = StreamController<String>();
    passwordErrorController = StreamController<String>();
    mainErrorController = StreamController<String>();
    navigateToController = StreamController<String>();
    isFormValidController = StreamController<bool>();
    isLoadingController = StreamController<bool>();
  }

  void mockStremas() {
    when(presenter.emailErrorStream)
        .thenAnswer((_) => emailErrorController.stream);
    when(presenter.passwordErrorStream)
        .thenAnswer((_) => passwordErrorController.stream);
    when(presenter.mainErrorStream)
        .thenAnswer((_) => mainErrorController.stream);
    when(presenter.navigateToStream)
        .thenAnswer((_) => navigateToController.stream);
    when(presenter.isFormValidStream)
        .thenAnswer((_) => isFormValidController.stream);
    when(presenter.isLoadingStream)
        .thenAnswer((_) => isLoadingController.stream);
  }

  void closeStreams() {
    emailErrorController.close();
    passwordErrorController.close();
    isFormValidController.close();
    isLoadingController.close();
    mainErrorController.close();
    navigateToController.close();
  }

  Future<void> LoadPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();

    initStreams();
    mockStremas();

    final loginPage = GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage(presenter)),
        GetPage(
            name: '/any_route', page: () => Scaffold(body: Text('fake page'))),
      ],
    );

    await tester.pumpWidget(loginPage);
  }

  tearDown(() {
    closeStreams();
  });

  testWidgets('Should load with correct initial state ',
      (WidgetTester tester) async {
    await LoadPage(tester);
    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(
      emailTextChildren,
      findsOneWidget,
      reason:
          'when a TextFormField has only one text child, means its has no error, since one of the childs is always the label text',
    );

    final passwordTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'), matching: find.byType(Text));
    expect(
      passwordTextChildren,
      findsOneWidget,
      reason:
          'when a TextFormField has only one text child, means its has no error, since one of the childs is always the label text',
    );

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, null);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
  testWidgets('Should call validate with correct values',
      (WidgetTester tester) async {
    await LoadPage(tester);
    final email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email'), email);
    verify(presenter.validateEmail(email));

    final password = faker.internet.password();
    await tester.enterText(find.bySemanticsLabel('Senha'), password);
    verify(presenter.validatePassword(password));
  });
  testWidgets('Should present error if email is valid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    emailErrorController.add('any error');
    await tester.pump();

    expect(find.text('any error'), findsOneWidget);
  });
  testWidgets('Should present no error if email is invalid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    emailErrorController.add(null);
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Email'), matching: find.byType(Text)),
        findsOneWidget);
  });
  testWidgets('Should present no error if email is invalid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    emailErrorController.add('');
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Email'), matching: find.byType(Text)),
        findsOneWidget);
  });
  testWidgets('Should present error if password is invalid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    passwordErrorController.add('any error');
    await tester.pump();

    expect(find.text('any error'), findsOneWidget);
  });
  testWidgets('Should present no error if password is invalid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    passwordErrorController.add(null);
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Senha'), matching: find.byType(Text)),
        findsOneWidget);
  });
  testWidgets('Should present no error if password is invalid',
      (WidgetTester tester) async {
    await LoadPage(tester);
    passwordErrorController.add('');
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Senha'), matching: find.byType(Text)),
        findsOneWidget);
  });
  testWidgets('Should enable button if form is valid ',
      (WidgetTester tester) async {
    await LoadPage(tester);
    isFormValidController.add(true);
    await tester.pump();

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, isNotNull);
  });
  testWidgets('Should disable button if form is invalid ',
      (WidgetTester tester) async {
    await LoadPage(tester);
    isFormValidController.add(false);
    await tester.pump();

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, null);
  });
  testWidgets('Should call authencication on form submit ',
      (WidgetTester tester) async {
    await LoadPage(tester);

    isFormValidController.add(true);
    await tester.pump();
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();
    verify(presenter.auth()).called(1);
  });
  testWidgets('Should present loading', (WidgetTester tester) async {
    await LoadPage(tester);

    isLoadingController.add(true);
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('Should hide loading', (WidgetTester tester) async {
    await LoadPage(tester);
    isLoadingController.add(true);
    await tester.pump();
    isLoadingController.add(false);
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
  testWidgets('Should present error message if authentication fails',
      (WidgetTester tester) async {
    await LoadPage(tester);
    mainErrorController.add('main error');
    await tester.pump();

    expect(find.text('main error'), findsOneWidget);
  });

  testWidgets('Should change page ', (WidgetTester tester) async {
    await LoadPage(tester);

    navigateToController.add('any_route');
    await tester.pumpAndSettle();
    expect(Get.currentRoute, 'any_route');
    expect(find.text('fake page'), findsOneWidget);
  });
}
