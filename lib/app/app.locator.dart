// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';
import '../services/user_service.dart';

final locator = GetIt.instance;
void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
}