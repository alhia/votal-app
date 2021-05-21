import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/home/home_viewmodel.dart';
import 'package:votal_app/ui/shared/ui_helpers.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {}),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                verticalSpaceLarge,
                Text(model.currentUser.id),
                Text(model.currentUser.name!),
                Text(model.currentUser.email!),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
