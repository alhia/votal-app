import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/services/file_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final _fileService = locator<FileService>();
  final _navigator = locator<AppRouter>();
  List<AssetEntity> _files = [];
  List<AssetEntity> get files => _files;
  AssetEntity? _selectedFile;
  AssetEntity? get selectedFile => _selectedFile;

  BetterPlayerController? videoPlayerController;

  void navigateBack() => _navigator.pop();

  void _getFiles() async {
    _files = await _fileService.getLocalFiles() ?? [];
    onVideoSelected(_files.first);
    notifyListeners();
  }

  void initialise() {
    _getFiles();
  }

  void onVideoSelected(AssetEntity file) async {
    if (videoPlayerController != null) {
      videoPlayerController!.pause();
    }
    videoPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 1,
        fit: BoxFit.fitWidth,
        autoPlay: false,
        handleLifecycle: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,
        ),
      ),
    );

    final awaited = await file.file;
    if (awaited != null) {
      _selectedFile = file;
      final source = BetterPlayerDataSource(
        BetterPlayerDataSourceType.file,
        awaited.uri.path,
      );

      videoPlayerController!.setupDataSource(source);
      videoPlayerController!.play();
      notifyListeners();
    }
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
