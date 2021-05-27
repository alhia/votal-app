import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:votal_app/app/app.logger.dart';

class CloudStorageService {
  final _log = getLogger('CloudStorageService');
  final _storage = FirebaseStorage.instance;
  Future<String?> uploadImage({
    required File file,
    required String storagePath,
  }) async {
    try {
      final taskSnapshot = await _storage
          .ref('$storagePath/${basename(file.path)}')
          .putFile(file);

      final fileUrl = await taskSnapshot.ref.getDownloadURL();
      _log.v('file created at $fileUrl');
      return fileUrl;
    } on FirebaseException catch (err) {
      _log.e(err);
    }
  }
}
