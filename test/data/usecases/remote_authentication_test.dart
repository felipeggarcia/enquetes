import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:enquetes/data/usecases/remote_authentication.dart';
import 'package:enquetes/domain/helpers/helpers.dart';
import 'package:enquetes/domain/usecases/usecases.dart';
import 'package:enquetes/data/http/http.dart';
import 'package:enquetes/data/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient;
  String url;
  RemoteAuthentication sut;
  AuthenticationParams params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
  });

  test('Should call HttpClient with correct values', () async {
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

  test('Should throw UnexpectError if HttpClient returns 400', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);


    final future = sut.auth(params);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectError if HttpClient returns 404', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);


    final future = sut.auth(params);
    expect(future, throwsA(DomainError.unexpected));
  });
}
