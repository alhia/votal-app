import 'dart:io';

import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/services/file_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final _fileService = locator<FileService>();
  List<AssetEntity> _files = [];
  List<AssetEntity> get files => _files;
  AssetEntity? _selectedFile;
  AssetEntity? get selectedFile => _selectedFile;

  void _getFiles() async {
    _files = await _fileService.getLocalFiles() ?? [];
    notifyListeners();
  }

  void initialise() {
    _getFiles();
  }

  void onVideoSelected() async {
    
  }
}
