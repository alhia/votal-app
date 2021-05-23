import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import 'create_post_viewmodel.dart';

class CreatePostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (
        BuildContext context,
        CreatePostViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: ListView.builder(
            itemCount: model.files.length,
            itemBuilder: (_, index) {
              print('hello: $index');
              final controller = VideoPlayerController.file(model.files[index])
                ..initialize();
              return controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          Center(child: Text('over')),
                          VideoPlayer(controller),
                          Center(child: Text('under')),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        );
      },
    );
  }
}
