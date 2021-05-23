import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/services/file_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final _fileService = locator<FileService>();
  List<File> _files = [];
  List<File> get files => _files;
  void _getFiles() async {
    _files = await _fileService.getLocalFiles() ?? [];
    notifyListeners();
  }

  void initialise() {
    _getFiles();
  }
}
