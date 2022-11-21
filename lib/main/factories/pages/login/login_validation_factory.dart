import 'package:enquetes/main/builders/validation_builders.dart';
import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/validation/protocols/protocols.dart';
import 'package:enquetes/main/builders/builders.dart';
import 'package:enquetes/validation/validators/validation_composite.dart';
import 'package:enquetes/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
