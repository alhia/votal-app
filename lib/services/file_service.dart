import 'dart:io';

import 'package:photo_manager/photo_manager.dart';

class FileService {
  Future<List<File>?> getLocalFiles() async {
    final List<File> assetEntities = [];

    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      final assetPaths = await PhotoManager.getAssetPathList();
      for (var assetPath in assetPaths) {
        final assetList = await assetPath.getAssetListRange(start: 0, end: 1);

        for (var asset in assetList) {
          File? file = await asset.file;
          if (asset.type == AssetType.video &&
              await asset.exists &&
              file != null) assetEntities.add(file);
        }
      }
      
    } 
    return assetEntities;
  }
}
