import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/services/user_service.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    log.i('valued:$formValueMap');

    try {
      final result = '';

      await _handleAuthenticationResponse(result);
    } catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    //await _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    //await _handleAuthenticationResponse(result);
  }

  /// Checks if the result has an error. If it doesn't we navigate to the success view
  /// else we show the friendly validation message.
  Future<void> _handleAuthenticationResponse(authResult) async {
    log.v('authResult.hasError:${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user!;

      /*    await userService.syncOrCreateUserAccount(
        user: User(
          id: user.uid,
          email: user.email,
        ),
      ); */

      // navigate to success route
      navigationService.replaceWith(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf(
            'We have no error but the uer is null. This should not be happening');
      }

      log.w('Authentication Failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
