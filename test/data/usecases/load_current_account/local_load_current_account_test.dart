import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class LocalLoadCurrentAccount {
  final FetchSecureCacheStorege fetchSecureCacheStorege;

  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorege});

  Future<void> load() async {
    await fetchSecureCacheStorege.fetchSecure('token');
  }
}

abstract class FetchSecureCacheStorege {
  Future<void> fetchSecure(String key);
}

class FetchSecureCacheStoregeSpy extends Mock
    implements FetchSecureCacheStorege {}

void main() {
  test('Should callFetchSecureCacheStorage with correct value', () async {
    final fetchSecureCacheStorege = FetchSecureCacheStoregeSpy();
    final sut = LocalLoadCurrentAccount(
        fetchSecureCacheStorege: fetchSecureCacheStorege);
    await sut.load();
    verify(fetchSecureCacheStorege.fetchSecure('token'));
  });
}
