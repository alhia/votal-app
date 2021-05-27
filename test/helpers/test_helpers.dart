
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/models/user/user.dart';
import 'package:votal_app/services/file_service.dart';
import 'package:votal_app/services/user_service.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<FileService>(returnNullOnMissingStub: true),
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
  when(service.push(HomeWrapper()))
      .thenAnswer((_) => Future.value(HomeWrapper()));
  when(service.replace(LoginRoute()))
      .thenAnswer((_) => Future.value(LoginRoute()));
  locator.registerSingleton<AppRouter>(service);
  return service;
}

FileService getAndRegisterFileService() {
  _removeRegistrationIfExists<FileService>();
  final service = MockFileService();
  when(service.getLocalFiles()).thenAnswer((_) => Future.value(
      List.filled(10, AssetEntity(height: 3, id: '', typeInt: 1, width: 3))));
  locator.registerSingleton<FileService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterFileService();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<AppRouter>();
  locator.unregister<FileService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
