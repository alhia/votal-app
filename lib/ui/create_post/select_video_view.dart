import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/create_post/widgets/video_thumbnail.dart';
import 'package:votal_app/ui/create_post/widgets/video_view.dart';
import 'package:votal_app/ui/shared/app_colors.dart';

import 'create_post_viewmodel.dart';

class SelectVideoView extends ViewModelWidget<CreatePostViewModel> {
  const SelectVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreatePostViewModel model) {
    return Column(
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
    );
  }
}
