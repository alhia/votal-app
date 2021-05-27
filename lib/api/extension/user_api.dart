import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/exeptions/exeptions.dart';
import 'package:votal_app/models/user/user.dart';

class UserApi {
  final log = getLogger('FirestoreApi: User');

  final CollectionReference<User> usersCollection = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
          fromFirestore: (snapshot, _) =>
              User.fromJson(snapshot.data()!).copyWith(id: snapshot.id),
          toFirestore: (user, _) => user.toJson());

  Future<User?> create({required User user}) async {
    log.v('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user);
      final userFromFirebase = await userDocument.get();
      return userFromFirebase.data();
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> get({required String userId}) async {
    log.v('userId:$userId');

    if (userId.isNotEmpty) {
      final DocumentSnapshot<User> userDoc =
          await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }
      final User user = userDoc.data()!;
      log.v('User found. Data: ${user.id}');
      return user;
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }
}
