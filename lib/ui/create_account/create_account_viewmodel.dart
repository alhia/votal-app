import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/app/app.router.dart';
import 'package:votal_app/ui/base/authentication_viewmodel.dart';

import 'create_account_view.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {

  CreateAccountViewModel() : super(successRoute: Routes.homeView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateBack() => navigationService.back();
}
