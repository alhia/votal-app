import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
          body: Center(
            child: Text(
              'CreatePostView',
            ),
          ),
        );
      },
    );
  }
}
