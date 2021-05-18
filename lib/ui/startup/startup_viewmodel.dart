import 'package:stacked/stacked.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/services/user_service.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();

  Future<void> runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      // Do logged in stuff
    } else {
      // Do logged out stuff
    }
  }
}
