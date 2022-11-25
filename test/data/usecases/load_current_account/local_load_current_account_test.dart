import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:enquetes/data/cache/cache.dart';
import 'package:enquetes/domain/entities/entities.dart';
import 'package:enquetes/domain/helpers/helpers.dart';
import 'package:enquetes/data/usecases/usecases.dart';

class FetchSecureCacheStorageSpy extends Mock
    implements FetchSecureCacheStorage {}

void main() {
  LocalLoadCurrentAccount sut;
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  String token;

  PostExpectation mockFetchSecureCall() =>
      when(fetchSecureCacheStorage.fetchSecure(any));

  void mockFetchSecure() {
    mockFetchSecureCall().thenAnswer((_) async => token);
  }

  void mockFetchSecureError() {
    mockFetchSecureCall().thenThrow(Exception());
  }

  setUp(() {
    fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
    sut = LocalLoadCurrentAccount(
        fetchSecureCacheStorage: fetchSecureCacheStorage);
    token = faker.guid.guid();
    mockFetchSecure();
  });
  test('Should call FetchSecureCacheStorage with correct value', () async {
    await sut.load();
    verify(fetchSecureCacheStorage.fetchSecure('token'));
  });
  test('Should return an AccountEntity', () async {
    final account = await sut.load();
    expect(account, AccountEntity(token));
  });
  test('Should throw UnexpectedError if FetchSecureCacheStorage throws ',
      () async {
    mockFetchSecureError();

    final future = sut.load();
    expect(future, throwsA(DomainError.unexpected));
  });
}
