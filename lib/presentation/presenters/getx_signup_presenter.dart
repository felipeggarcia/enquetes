import 'package:get/state_manager.dart';
import 'package:meta/meta.dart';

import '../../ui/helpers/helpers.dart';

import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController {
  final Validation validation;

  final _emailError = Rx<UIError>();
  final _isFormValid = false.obs;

  Stream<UIError> get emailErrorStream => _emailError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;

  GetxSignUpPresenter({
    @required this.validation,
  });

  void validateEmail(String email) {
    _emailError.value = _validateField(field: 'email', value: email);
    _validateForm();
  }

  UIError _validateField({String field, String value}) {
    final error = validation.validate(field: field, value: value);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
        break;
      case ValidationError.requiredField:
        return UIError.requiredField;
        break;
      default:
        return null;
    }
  }

  void _validateForm() {
    _isFormValid.value = false;
  }
}
