import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:votal_app/ui/dumb_widgets/authentication_layout.dart';

import 'create_account_view.form.dart';
import 'create_account_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: AuthenticationLayout(
            busy: model.isBusy,
            onMainButtonTapped: model.saveData,
            onBackPressed: model.navigateBack,
            validationMessage: model.validationMessage,
            title: 'Create Account',
            subtitle: 'Enter your name, email and password for sign up.',
            mainButtonTitle: 'SIGN UP',
            form: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  controller: fullNameController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: emailController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: passwordController,
                ),
              ],
            ),
            showTermsText: true,
          )),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}
