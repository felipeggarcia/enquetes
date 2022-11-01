import '../../domain/usecases/usecases.dart';
import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  Future<void>? auth(AuthenticationParams params) async {
    httpClient.request(url: url, method: 'post', body: params.toJson());
  }

  RemoteAuthentication({
    required this.httpClient,
    required this.url,
  });
}
