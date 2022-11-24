import 'package:enquetes/data/usecases/usecases.dart';
import 'package:enquetes/domain/usecases/usecases.dart';
import 'package:enquetes/main/factories/factories.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalStorageAdapter());
}
