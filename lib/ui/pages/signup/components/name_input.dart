import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../pages.dart';

import '../../../helpers/helpers.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError>(
        stream: presenter.nameErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: R.strings.name,
              icon: Icon(Icons.person,
                  color: Theme.of(context).primaryColorLight),
            ),
            keyboardType: TextInputType.name,
            onChanged: presenter.validateName,
          );
        });
  }
}
