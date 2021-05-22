import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/models/user/user.dart';
import 'package:votal_app/services/user_service.dart';
import 'package:votal_app/ui/feed/feed_view.dart';
import 'package:votal_app/ui/profile/profile_view.dart';

class HomeViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  User get currentUser => _userService.currentUser!;
  void logOut() => locator<FirebaseAuthenticationService>().logout();
  List<Widget> tabViews = [FeedView(), ProfileView()];
  void onItemTapped(int index) {
    _selectedIndex = index;
    print(index);
    notifyListeners();
  }
}
