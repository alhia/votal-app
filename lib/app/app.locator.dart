import 'package:get_it/get_it.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/api/firestore_api.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/services/user_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerSingleton(FirebaseAuthenticationService());
}
