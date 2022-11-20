import 'package:test/test.dart';

abstract class FieldValidation {
  String get field;
  String validate(String value);
}

class RequiredFieldValidation implements FieldValidation {
  final String field;
  RequiredFieldValidation(this.field);
  String validate(String value) {
    return value?.isNotEmpty == true ? null : 'Campo Obrigatório';
  }
}

void main() {
  RequiredFieldValidation sut;
  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if values is not empty', () {
    expect(sut.validate('any_value'), null);
  });
  test('Should return error if values is empty', () {
    expect(sut.validate(''), 'Campo Obrigatório');
  });
  test('Should return error if values is null', () {
    expect(sut.validate(null), 'Campo Obrigatório');
  });
}
