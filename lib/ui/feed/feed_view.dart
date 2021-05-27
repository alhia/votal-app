import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:tcard/tcard.dart';
import 'package:votal_app/models/post/post.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

import 'feed_viewmodel.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.nonReactive(
      onModelReady: (model) => model.initialise(),
      viewModelBuilder: () => FeedViewModel(),
      builder: (
        BuildContext context,
        FeedViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<QuerySnapshot<Post>>(
                  stream: model.postSnapShot,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    if (snapshot.hasData) {
                      final data = snapshot.requireData;
                      /*       return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          Post post = data.docs[index].data();

                          print(post.caption!);
                          return Text(post.creatorId);
                        },
                      ); */
                      return Center(
                        child: TCard(
                            size: Size(
                              screenWidthPercentage(context, percentage: 0.8),
                              screenHeightPercentage(context, percentage: 0.7),
                            ),
                            cards: data.docs.map((post) {
                              final postData = post.data();
                              return Container(
                                child: Stack(
                                  children: [
                                    BetterPlayer.network(
                                      postData.fileUrl,
                                      betterPlayerConfiguration:
                                          BetterPlayerConfiguration(
                                        aspectRatio: 2 / 3,
                                        fit: BoxFit.fitWidth,
                                        autoPlay: true,
                                        looping: true,
                                        handleLifecycle: true,
                                        controlsConfiguration:
                                            BetterPlayerControlsConfiguration(
                                          showControls: false,
                                        ),
                                      ),
                                    ),
                                    Text(postData.creatorId),
                                  ],
                                ),
                              );
                            }).toList()),
                      );
                    }

                    return Container();
                  },
                ),
        );
      },
    );
  }
}
