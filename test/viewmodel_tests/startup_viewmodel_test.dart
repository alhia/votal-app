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
      test('When called should check if we have a logged in user on UserService', () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartupLogic();
        verify(userService.hasLoggedInUser);
      });
    });
  });
}
