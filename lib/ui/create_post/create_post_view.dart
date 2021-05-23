import 'dart:typed_data';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

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
          body: Column(
            children: [
              BetterPlayer.file(url),
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  model.files.length,
                  (int index) {
                    print('hello: ${model.files[index]}');
                    final file = model.files[index];
                    return FutureBuilder<Uint8List?>(
                        future: file.thumbDataWithSize(
                            screenHeight(context).toInt(),
                            screenHeight(context).toInt()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return InkWell(
                              onTap: model.onVideoSelected,
                                child: Image.memory(
                              snapshot.data!,
                              fit: BoxFit.fitWidth,
                              width:
                                  screenWidthPercentage(context, percentage: 0.3),
                              height:
                                  screenWidthPercentage(context, percentage: 0.3),
                            ));
                          return Container();
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
