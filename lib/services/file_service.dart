import 'package:photo_manager/photo_manager.dart';
import 'package:votal_app/app/app.logger.dart';

class FileService {
  final _log = getLogger('FileService');
  Future<List<AssetEntity>?> getLocalFiles() async {
    final List<AssetEntity> files = [];

    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      final assetPaths = await PhotoManager.getAssetPathList();
      final videosFolder =
          assetPaths.singleWhere((path) => path.name == 'Videos');

      final videosPaged = await videosFolder.getAssetListPaged(0, 100);
      files.addAll(videosPaged);
    }
    _log.v('Returning ${files.length} files');
    return files;
  }
}
