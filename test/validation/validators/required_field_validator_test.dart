import 'package:enquetes/validation/validators/validators.dart';
import 'package:test/test.dart';

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
