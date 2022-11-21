import 'package:enquetes/presentation/presenters/presenters.dart';
import 'package:enquetes/ui/pages/pages.dart';
import '../../usecases/usecases.dart';

import 'login_validation_factory.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}
