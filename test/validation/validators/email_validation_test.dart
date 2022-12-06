import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/validation/validators/validators.dart';

import 'package:test/test.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Should return null if email is null', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate({'any_field': 'rodrigo.manguinho@gmail.com'}), null);
  });

  test('Should return error if email is invalid', () {
    expect(sut.validate({'any_field': 'rodrigo.manguinho'}),
        ValidationError.invalidField);
  });
}
