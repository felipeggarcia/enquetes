import 'package:enquetes/infra/http/http.dart';
import 'package:http/http.dart';

HttpAdapter makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}
