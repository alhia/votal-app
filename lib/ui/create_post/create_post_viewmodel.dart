import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:votal_app/api/firestore_api.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/app.logger.dart';
import 'package:votal_app/app/locator.dart';
import 'package:votal_app/models/post/post.dart';
import 'package:votal_app/services/cloud_storage_service.dart';
import 'package:votal_app/services/file_service.dart';
import 'package:votal_app/services/user_service.dart';
import 'package:votal_app/ui/create_post/create_post_view.form.dart';

class CreatePostViewModel extends FormViewModel {
  final _log = getLogger('CreatePostViewModel');
  final _fileService = locator<FileService>();
  final _userService = locator<UserService>();
  final _navigator = locator<AppRouter>();
  final _fireStoreApi = locator<FirestoreApi>();
  final _cloudStorageService = locator<CloudStorageService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _captionFocusNode = FocusNode();

  List<AssetEntity> _files = [];
  List<AssetEntity> get files => _files;
  AssetEntity? _selectedFile;
  bool _selectVideo = true;
  bool _showProfile = false;
  bool _showPlayButton = true;
  AssetEntity? get selectedFile => _selectedFile;
  FocusNode get captionFocusNode => _captionFocusNode;
  bool get selectVideo => _selectVideo;
  bool get showProfile => _showProfile;
  bool get showPlayButton => _showPlayButton;
  BetterPlayerController? videoPlayerController;
  @override
  void setFormStatus() {}

  void onVideoPlayerPressed() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.isPlaying()!) {
        videoPlayerController!.pause();
        _showPlayButton = true;
      } else {
        _showPlayButton = false;
        videoPlayerController!.play();
      }
    }
    notifyListeners();
  }

  void navigateBack() => _navigator.pop();
  void toggleSelectVideo() {
    _selectVideo = !_selectVideo;
    if (_selectVideo && _selectedFile != null) onVideoSelected(_selectedFile!);
    notifyListeners();
  }

  void toggleShowProfile(bool newValue) {
    _showProfile = newValue;
    notifyListeners();
  }

  void _getFiles() async {
    _files = await _fileService.getLocalFiles() ?? [];
    onVideoSelected(_files.first);
    notifyListeners();
  }

  void initialise() {
    _getFiles();
  }

  void onVideoSelected(AssetEntity file) async {
    bool shouldPlay = true;
    if (videoPlayerController != null) {
      if (videoPlayerController!.isPlaying()!) videoPlayerController!.pause();
    } else {
      shouldPlay = false;
    }
    videoPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 1,
        fit: BoxFit.fitWidth,
        autoPlay: false,
        looping: true,
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
      if (shouldPlay) {
        videoPlayerController!.play();
        _showPlayButton = false;
      }
      notifyListeners();
    }
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void createPost() async {
    try {
      final _file = await _selectedFile!.file;
      final _fileUrl = await _cloudStorageService.uploadImage(
          file: _file!, storagePath: 'postFiles');
      if (_fileUrl != null &&
          _firebaseAuthenticationService.currentUser != null) {
        Post post = Post(
          creatorId: _firebaseAuthenticationService.currentUser!.uid,
          displayProfile: _showProfile,
          fileUrl: _fileUrl,
          caption: captionValue,
        );
        await _fireStoreApi.post.create(post: post);
        _navigator.pop();
      }
    } catch (err) {
      _log.e(err);
    }
  }
}
