import 'package:enquetes/data/http/http.dart';
import 'package:enquetes/data/models/models.dart';
import 'package:enquetes/domain/entities/entities.dart';
import 'package:enquetes/domain/helpers/helpers.dart';
import 'package:meta/meta.dart';

class RemoteLoadSurveys {
  final String url;
  final HttpClient<List<Map>> httpClient;
  RemoteLoadSurveys({@required this.url, @required this.httpClient});

  Future<List<SurveyEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse
          .map((json) => RemoteSurveyModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
