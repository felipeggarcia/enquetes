import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:enquetes/presentation/protocols/protocols.dart';

import 'package:enquetes/validation/protocols/protocols.dart';

class MinLengthValidation implements FieldValidation {
  final String field;
  final int size;

  MinLengthValidation({@required this.field, @required this.size});

  @override
  ValidationError validate(String value) {
    return value != null && value.length >= size
        ? null
        : ValidationError.invalidField;
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
  test('Should return error if values is less than min size', () {
    final error = sut.validate(faker.randomGenerator.string(4, min: 1));

    expect(error, ValidationError.invalidField);
  });
  test('Should return null if values is equal than min size', () {
    final error = sut.validate(faker.randomGenerator.string(5, min: 5));

    expect(error, null);
  });
  test('Should return null if values is bigger than min size', () {
    final error = sut.validate(faker.randomGenerator.string(10, min: 6));

    expect(error, null);
  });
}
