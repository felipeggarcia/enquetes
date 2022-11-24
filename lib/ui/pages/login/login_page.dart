import 'package:enquetes/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import './components/components.dart';
import '../../components/components.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return GestureDetector(
      onTap: _hideKeyboard,
      child: Scaffold(
        body: Builder(builder: (context) {
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });
          presenter.mainErrorStream.listen((error) {
            if (error != null) {
              showErrorMessage(context, error);
            }
          });

          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                LoginHeader(),
                Headline1(text: 'Login'),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Provider(
                    create: (_) => presenter,
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        EmailInput(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 32,
                          ),
                          child: PasswordInput(),
                        ),
                        LoginButton(),
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                          label: Text('Criar Conta'),
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
