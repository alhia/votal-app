import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/models/user/user.dart';
import 'package:votal_app/services/user_service.dart';

class HomeViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  User get currentUser => _userService.currentUser!;
}
