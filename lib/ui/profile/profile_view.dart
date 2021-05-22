import 'package:flutter/material.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/app/locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('Profile View'),
            TextButton(
              onPressed: locator<FirebaseAuthenticationService>().logout,
              child: Text('Profile View'),
            )
          ],
        ),
      ),
    );
  }
}
