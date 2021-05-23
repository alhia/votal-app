import 'package:photo_manager/photo_manager.dart';

class FileService {
  Future<List<AssetEntity>?> getLocalFiles() async {
    final List<AssetEntity> files = [];

    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      final assetPaths = await PhotoManager.getAssetPathList();
      final videosFolder =
          assetPaths.singleWhere((path) => path.name == 'Videos');

      final videosPaged = await videosFolder.getAssetListPaged(0, 10);
      files.addAll(videosPaged);

      /* for (var video in videosPaged) {
        final file = await video.file;
        if (file != null) {
          files.add(file);
        }
      } */
    }
    return files;
  }
}
