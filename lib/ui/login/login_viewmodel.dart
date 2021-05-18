import 'package:votal_app/app/app.router.dart';
import 'package:votal_app/ui/base/authentication_viewmodel.dart';

class LoginViewModel extends AuthenticationViewModel {
  LoginViewModel() : super(successRoute: Routes.startUpView);

/*   @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      ); */

/*   void navigateToCreateAccount() =>
      navigationService.navigateTo(Routes.createAccountView); */
}
