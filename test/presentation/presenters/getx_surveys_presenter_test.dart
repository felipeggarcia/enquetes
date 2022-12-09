import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:enquetes/domain/usecases/load_surveys.dart';

class GetxSurveysPresenter {
  final LoadSurveys loadSurveys;

  GetxSurveysPresenter({@required this.loadSurveys});
  Future<void> loadData() async {
    await loadSurveys.load();
  }
}

class LoadSurveysSpy extends Mock implements LoadSurveys {}

void main() {
  LoadSurveysSpy loadSurveys;
  GetxSurveysPresenter sut;
  setUp(() {
    loadSurveys = LoadSurveysSpy();
    sut = GetxSurveysPresenter(loadSurveys: loadSurveys);
  });
  test('Should call LoadSurveys on loadData', () async {
    await sut.loadData();

    verify(loadSurveys.load()).called(1);
  });
}
