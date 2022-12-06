import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(
        field: 'any_field', fieldToCompare: 'other_field');
  });
  test('Should return error if values are not equal', () {
    final formData = {'any_field': 'any_value', 'other_field': 'other_value'};

    final error = sut.validate(formData);

    expect(error, ValidationError.invalidField);
  });
  test('Should return null if values are equals', () {
    final formData = {'any_field': 'any_value', 'other_field': 'any_value'};

    final error = sut.validate(formData);

    expect(error, null);
  });
}
