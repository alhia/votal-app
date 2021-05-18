import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:votal_app/ui/views/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

StartupViewModel _getModel() => StartupViewModel();
void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runStartupLogic -', () {
      test(
          'When called should check if we have a logged in user on UserService',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartupLogic();
        verify(userService.hasLoggedInUser);
      });
    });
    test('When we have no logged in user, should navigate to the login view',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = _getModel();
      await model.runStartupLogic();

      verify(navigationService.replaceWith(Routes.loginView));
    });

    test(
        'When hasLoggedInUser is true, should call syncUserAccount on the userService',
        () async {
      final userService = getAndRegisterUserService(hasLoggedInUser: true);
      final model = _getModel();
      await model.runStartupLogic();

      verify(userService.syncUserAccount());
    });

    test(
        'When hasLoggedInUser is true, should get currentUser from userService',
        () async {
      final userService = getAndRegisterUserService(hasLoggedInUser: true);
      final model = _getModel();
      await model.runStartupLogic();

      verify(userService.currentUser);
    });
  });
}
