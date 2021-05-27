import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/api/firestore_api.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/models/user/user.dart';

class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;
    log.i('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.user.get(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user ...');
      await _firestoreApi.user.create(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  void removeUser() async {
    _currentUser = null;
  }
}
