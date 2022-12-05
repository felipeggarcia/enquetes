import 'package:test/test.dart';

import 'package:enquetes/presentation/protocols/protocols.dart';

import 'package:enquetes/validation/protocols/protocols.dart';

class MinLengthValidation implements FieldValidation {
  final String field;
  final int size;

  MinLengthValidation({this.field, this.size});

  @override
  ValidationError validate(String value) {
    return ValidationError.invalidField;
  }
}

void main() {
  MinLengthValidation sut;

  setUp(() {
    sut = MinLengthValidation(field: 'any_field', size: 5);
  });
  test('Should return error if values is empty', () {
    final error = sut.validate('');

    expect(error, ValidationError.invalidField);
  });
  test('Should return error if values is null', () {
    final error = sut.validate(null);

    expect(error, ValidationError.invalidField);
  });
}
