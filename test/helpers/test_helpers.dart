import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/models/user/user.dart';
import 'package:votal_app/services/user_service.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<AppRouter>(returnNullOnMissingStub: true),
])
UserService getAndRegisterUserService({
  bool hasLoggedInUser = false,
  User? currentUser,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  when(service.currentUser).thenReturn(currentUser ?? User(id: 'default_user'));
  locator.registerSingleton<UserService>(service);
  return service;
}

AppRouter getAndRegisterNavigationService() {
  _removeRegistrationIfExists<AppRouter>();
  final service = MockAppRouter();
  locator.registerSingleton<AppRouter>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<AppRouter>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
