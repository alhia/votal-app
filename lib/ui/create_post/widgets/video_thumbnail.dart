import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/create_post/create_post_viewmodel.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

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
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: MemoryImage(
                                  snapshot.data!,
                                ),
                                colorFilter: model.selectedFile == file &&
                                        model.selectVideo
                                    ? ColorFilter.mode(
                                        Colors.white.withOpacity(0.6),
                                        BlendMode.modulate,
                                      )
                                    : null,
                                fit: BoxFit.fitWidth,
                              )),
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
                    ),
                  )),
            );
          return Container();
        });
  }
}
