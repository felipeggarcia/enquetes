import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(
        field: 'any_field', valueToCompare: 'any_value');
  });
  test('Should return error if values are not equal', () {
    final error = sut.validate('wrong_value');

    expect(error, ValidationError.invalidField);
  });
  test('Should return null if values are equals', () {
    final error = sut.validate('any_value');

    expect(error, null);
  });
}
