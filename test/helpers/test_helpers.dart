import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/services/user_service.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
])
UserService getAndRegisterUserService({
  bool hasLoggedInUser = false,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  locator.registerSingleton<UserService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
