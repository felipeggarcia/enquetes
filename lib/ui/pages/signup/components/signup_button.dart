import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages.dart';
import '../../../helpers/helpers.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: snapshot.data == true ? presenter.signUp : null,
            child: Text(R.strings.signUp.toUpperCase()),
          );
        });
  }
}
