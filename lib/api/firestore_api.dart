import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/exeptions/exeptions.dart';
import 'package:votal_app/models/user/user.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');


  final CollectionReference<User> usersCollection = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
          fromFirestore: (snapshots, _) =>
              User.fromJson(snapshots.data()!).copyWith(id: snapshots.id),
          toFirestore: (user, _) => user.toJson());

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user);
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final DocumentSnapshot<User> userDoc =
          await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }
      final User user = userDoc.data()!;
      log.v('User found. Data: $user');

      return user;
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }
}
