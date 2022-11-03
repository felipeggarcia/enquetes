import 'package:enquetes/domain/entities/account_entity.dart';
import 'package:flutter/cupertino.dart';

abstract class HttpClient {
  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  });
}
