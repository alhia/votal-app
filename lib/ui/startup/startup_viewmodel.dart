import 'package:stacked/stacked.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/services/user_service.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  final router = locator<AppRouter>();
  Future<void> runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser ?? null;
      log.v('User sync complete. User profile: $currentUser');

      router.push(HomeWrapper());
    } else {
      log.v('No user on disk, navigate to the LoginView');
      router.replace(LoginRoute());
    }
  }
}
