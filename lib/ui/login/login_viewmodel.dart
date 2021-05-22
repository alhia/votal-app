import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/ui/base/authentication_viewmodel.dart';

import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: HomeRoute());

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateToCreateAccount() => router.push(CreateAccountRoute());
}
