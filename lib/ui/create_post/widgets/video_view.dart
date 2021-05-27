import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/create_post/create_post_viewmodel.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

class VideoView extends ViewModelWidget<CreatePostViewModel> {
  const VideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreatePostViewModel model) {
    if (model.videoPlayerController != null)
      return InkWell(
        onTap: model.onVideoPlayerPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BetterPlayer(
              controller: model.videoPlayerController!,
            ),
            if (model.showPlayButton)
              Icon(
                Icons.play_arrow,
                color: Colors.white70,
                size: screenWidthPercentage(context, percentage: 0.16),
              )
          ],
        ),
      );
    return Container();
  }
}
