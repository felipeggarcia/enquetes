import 'package:meta/meta.dart';

import '../../../domain/usecases/load_surveys.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';

import '../../models/models.dart';
import '../../http/http.dart';

class RemoteLoadSurveys implements LoadSurveys {
  final String url;
  final HttpClient httpClient;
  RemoteLoadSurveys({@required this.url, @required this.httpClient});

  Future<List<SurveyEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse
          .map<SurveyEntity>(
              (json) => RemoteSurveyModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
