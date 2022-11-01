import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:enquetes/domain/usecases/usecases.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  Future<void>? auth(AuthenticationParams params) async {
    final body = {
      'email': params.email,
      'password': params.secret,
    };
    httpClient.request(url: url, method: 'post', body: body);
  }

  RemoteAuthentication({
    required this.httpClient,
    required this.url,
  });
}

abstract class HttpClient {
  Future<void>? request({
    required String url,
    required String method,
    Map body,
  });
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient = HttpClientSpy();
  String url = faker.internet.httpUrl();
  RemoteAuthentication sut =
      RemoteAuthentication(httpClient: httpClient, url: url);

  test('Should call HttpClient with correct values', () async {
    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );

    await sut.auth(params);
    verify(httpClient.request(
      url: url,
      method: 'post',
      body: {
        'email': params.email,
        'password': params.secret,
      },
    ));
  });
}
