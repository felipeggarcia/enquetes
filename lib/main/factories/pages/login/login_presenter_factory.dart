import 'package:enquetes/main/factories/usecases/save_current_account_factory.dart';
import 'package:enquetes/presentation/presenters/presenters.dart';

import 'package:enquetes/ui/pages/pages.dart';
import '../../usecases/usecases.dart';

import 'login_validation_factory.dart';

// LoginPresenter makeStreamLoginPresenter() {
//   return StreamLoginPresenter(
//       authentication: makeRemoteAuthentication(),
//       validation: makeLoginValidation());
// }

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation(),
      saveCurrentAccount: makeLocalSaveCurrentAccount());
}
