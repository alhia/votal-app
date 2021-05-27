import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:votal_app/ui/create_post/select_video_view.dart';
import 'package:votal_app/ui/create_post/widgets/video_thumbnail.dart';

import 'create_post_view.form.dart';
import 'create_post_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'caption'),
])
class CreatePostView extends StatelessWidget with $CreatePostView {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      onModelReady: (model) {
        model.initialise();
        listenToFormUpdated(model);
      },
      builder: (
        BuildContext context,
        CreatePostViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 8,
            leadingWidth: 70,
            leading: InkWell(
              onTap: model.navigateBack,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: theme.textTheme.button,
                  ),
                ),
              ),
            ),
            title: Center(child: Text('New post')),
            actions: [
              InkWell(
                onTap: model.captionFocusNode.hasFocus
                    ? model.captionFocusNode.unfocus
                    : model.selectVideo
                        ? model.toggleSelectVideo
                        : model.createPost,
                child: Container(
                  width: 70,
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      model.captionFocusNode.hasFocus
                          ? 'OK'
                          : model.selectVideo
                              ? 'Next'
                              : 'Post',
                      style: theme.textTheme.button!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: model.selectVideo
              ? SelectVideoView()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 92,
                            width: 92,
                            child: VideoThumbnail(file: model.selectedFile!),
                          ),
                          Expanded(
                            child: TextField(
                              focusNode: model.captionFocusNode,
                              minLines: 3,
                              maxLines: 5,
                              controller: captionController,
                              decoration: InputDecoration(
                                hintText: 'Add caption...',
                              ).applyDefaults(
                                theme.inputDecorationTheme.copyWith(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.all(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Show profile',
                                  style: theme.textTheme.bodyText1,
                                ),
                                CupertinoSwitch(
                                  value: model.showProfile,
                                  onChanged: model.toggleShowProfile,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
