import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class FileService {
  Future<List<File>?> getLocalFiles() async {
    final paths = await PhotoManager.getAssetPathList();
    for (var path in paths) {
      print(path);
    }
  }
}
