import '../helpers.dart';

enum UIError {
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
  emailInUse,
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return R.strings.requiredField;
      case UIError.invalidField:
        return R.strings.invalidField;
      case UIError.invalidCredentials:
        return R.strings.invalidCredentials;
      case UIError.emailInUse:
        return R.strings.emailInUse;
      default:
        return R.strings.unexpected;
    }
  }
}
