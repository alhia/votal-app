import 'package:auto_route/auto_route.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/services/user_service.dart';

import 'app.locator.dart';

// mock auth state

class AuthGuard extends AutoRouteGuard {
  final _userService = locator<UserService>();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print('auth is triggered');

    if (!_userService.hasLoggedInUser) {
      print('auth is triggered');
      router.replace(LoginRoute());
      resolver.next();
    } else {
      _userService.removeUser();
      resolver.next(true);
    }
  }
  
}
