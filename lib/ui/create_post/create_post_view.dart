import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/shared/app_colors.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

import 'create_post_viewmodel.dart';

class CreatePostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (
        BuildContext context,
        CreatePostViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 8,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: model.navigateBack,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: theme.textTheme.button,
                    ),
                  ),
                ),
                Text('New post'),
                InkWell(
                  child: Text(
                    'Next',
                    style: theme.textTheme.button!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              if (model.videoPlayerController != null) VideoView(),
              Container(height: 64, color: AppColors.surface),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(
                    model.files.length,
                    (int index) {
                      final file = model.files[index];
                      return VideoThumbnail(file: file);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VideoThumbnail extends ViewModelWidget<CreatePostViewModel> {
  const VideoThumbnail({
    Key? key,
    required this.file,
  }) : super(key: key);

  final AssetEntity file;

  @override
  Widget build(BuildContext context, CreatePostViewModel model) {
    final theme = Theme.of(context);

    return FutureBuilder<Uint8List?>(
        future: file.thumbDataWithSize(
            screenHeight(context).toInt(), screenHeight(context).toInt()),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: InkWell(
                  onTap: () => model.onVideoSelected(file),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: MemoryImage(
                                snapshot.data!,
                              ),
                              colorFilter: model.selectedFile == file
                                  ? ColorFilter.mode(
                                      Colors.white.withOpacity(0.6),
                                      BlendMode.modulate,
                                    )
                                  : null,
                              fit: BoxFit.fitWidth,
                            )),
                        width: screenWidthPercentage(context, percentage: 0.3),
                        height: screenWidthPercentage(context, percentage: 0.3),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            model.printDuration(
                              Duration(seconds: file.duration),
                            ),
                            style: theme.textTheme.caption!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
            );
          return Container();
        });
  }
}

class VideoView extends ViewModelWidget<CreatePostViewModel> {
  const VideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreatePostViewModel model) {
    if (model.videoPlayerController != null)
      return BetterPlayer(
        controller: model.videoPlayerController!,
      );
    return Container();
  }
}
