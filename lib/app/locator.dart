import 'package:get_it/get_it.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/api/firestore_api.dart';
import 'package:votal_app/services/cloud_storage_service.dart';
import 'package:votal_app/services/file_service.dart';
import 'package:votal_app/services/user_service.dart';

import 'app.gr.dart';
import 'auth_guard.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(FirebaseAuthenticationService());

  locator.registerLazySingleton(() => AppRouter(authGuard: AuthGuard()));
  locator.registerLazySingleton(() => DialogService());

  locator.registerLazySingleton(() => FirestoreApi());

  locator.registerLazySingleton(() => FileService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => CloudStorageService());
}
