import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/validation/validators/required_field_validation.dart';
import 'package:enquetes/validation/validators/validation_composite.dart';
import 'package:enquetes/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ]);
}
