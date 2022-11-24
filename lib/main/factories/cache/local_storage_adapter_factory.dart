import 'package:enquetes/infra/cache/local_storage_adapter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

LocalStorageAdapter makeLocalStorageAdapter() {
  final secureStorage = FlutterSecureStorage();
  return LocalStorageAdapter(secureStorage: secureStorage);
}
