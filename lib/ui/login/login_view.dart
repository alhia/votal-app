import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:votal_app/ui/dumb_widgets/authentication_layout.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        busy: model.isBusy,
        onMainButtonTapped: model.saveData,
        onCreateAccountTapped: model.navigateToCreateAccount,
        validationMessage: model.validationMessage,
        title: 'Welcome',
        subtitle: 'Please sign up to your account to continue.',
        mainButtonTitle: 'SIGN IN',
        form: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: emailController,
            ),
            verticalSpaceRegular,
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
          ],
        ),
        onForgotPassword: () {},
        onSignInWithGoogle: model.useGoogleAuthentication,
        onSignInWithFacebook: model.useFacebookAuthentication,
      )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
