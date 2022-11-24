import 'package:enquetes/domain/helpers/helpers.dart';
import 'package:enquetes/domain/usecases/usecases.dart';
import 'package:enquetes/presentation/protocols/protocols.dart';
import 'package:enquetes/ui/pages/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;
  final SaveCurrentAccount saveCurrentAccount;

  String _email;
  String _password;

  var _emailError = RxString();
  var _passwordError = RxString();
  var _mainError = RxString();
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get emailErrorStream => _emailError.stream;
  Stream<String> get passwordErrorStream => _passwordError.stream;
  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<bool> get isLoadingStream => _isFormValid.stream;
  Stream<bool> get isFormValidStream => _isLoading.stream;

  GetxLoginPresenter(
      {this.validation,
      @required this.authentication,
      this.saveCurrentAccount});

  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: 'email', value: email);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: 'password', value: password);
    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value = _emailError.value == null &&
        _email != null &&
        _passwordError.value == null &&
        _password != null;
  }

  Future<void> auth() async {
    try {
      _isLoading.value = true;
      final account = await authentication
          .auth(AuthenticationParams(email: _email, secret: _password));
      await saveCurrentAccount.save(account);
    } on DomainError catch (error) {
      _mainError.value = error.description;
      _isLoading.value = false;
    }
  }

  void dispose() {}
}
