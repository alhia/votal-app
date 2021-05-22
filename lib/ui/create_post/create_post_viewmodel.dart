import 'package:stacked/stacked.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/services/file_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final _fileService = locator<FileService>();
  void initialise() {
    _fileService.getLocalFiles();
  }
}
