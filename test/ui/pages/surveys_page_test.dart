import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'package:enquetes/ui/pages/pages.dart';

class SurveysPresenterSpy extends Mock implements SurveysPresenter {}

void main() {
  SurveysPresenterSpy presenter = SurveysPresenterSpy();
  GetMaterialApp surveysPage;
  Future<void> loadPage(WidgetTester tester) async {
    surveysPage = GetMaterialApp(
      initialRoute: '/surveys',
      getPages: [
        GetPage(
          name: '/surveys',
          page: () => SurveysPage(presenter),
        )
      ],
    );
  }

  testWidgets('Should call LoadSurveys on page load',
      (WidgetTester tester) async {
    await loadPage(tester);
    await tester.pumpWidget(surveysPage);

    verify(presenter.loadData()).called(1);
  });
}
