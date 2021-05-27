import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/api/firestore_api.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/models/post/post.dart';

class FeedViewModel extends BaseViewModel {
  final _firestoreApi = locator<FirestoreApi>();

  Stream<QuerySnapshot<Post>>? _postSnapshot;
  Stream<QuerySnapshot<Post>>? get postSnapShot => _postSnapshot;
  void initialise() {
    _getSnapShot();
  }

  void _getSnapShot() {
    setBusy(true);
    final _snapshot = _firestoreApi.post.getAll();
    _postSnapshot = _snapshot;
    setBusy(false);
    notifyListeners();
  }
}
