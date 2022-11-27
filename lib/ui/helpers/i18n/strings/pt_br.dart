import 'translations.dart';

class PtBr implements Translations {
  @override
  String get email => 'Email';
  String get invalidCredentials => 'Credenciais inválidas.';
  String get invalidField => 'Campo inválido';
  String get login => 'Login';
  String get password => 'Senha';
  String get requiredField => 'Campo obrigatório';
  String get signIn => 'Entrar';
  String get signUp => 'Criar conta';
  String get unexpected => 'Algo errado aconteceu. Tente novamente em breve.';
}
