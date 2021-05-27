import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/exeptions/exeptions.dart';
import 'package:votal_app/models/post/post.dart';

class PostApi {
  final _log = getLogger('FirestoreApi: Post');
  final CollectionReference<Post> postsCollection = FirebaseFirestore.instance
      .collection('posts')
      .withConverter<Post>(
          fromFirestore: (snapshots, _) =>
              Post.fromJson(snapshots.data()!).copyWith(id: snapshots.id),
          toFirestore: (post, _) => post.toJson());

  Future<void> create({required Post post}) async {
    _log.i('Post:$Post');

    try {
      final postDocument = await postsCollection.add(post);
      _log.v('PostCreated at ${postDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new Post',
        devDetails: '$error',
      );
    }
  }

  Future<Post?> get({required String postId}) async {
    _log.i('postId:$postId');

    if (postId.isNotEmpty) {
      final DocumentSnapshot<Post> postDoc =
          await postsCollection.doc(postId).get();
      if (!postDoc.exists) {
        _log.v('We have no Post with id $postId in our database');
        return null;
      }
      final Post post = postDoc.data()!;
      _log.v('Post found. Data: $Post');

      return post;
    } else {
      throw FirestoreApiException(
          message:
              'Your postId passed in is empty. Please pass in a valid Post if from your Firebase Post.');
    }
  }

  Stream<QuerySnapshot<Post>>? getAll() {
    _log.i('Get all posts');
    try {
      return postsCollection.snapshots();
    } catch (error) {
      _log.e(error);
    }
  }
}
