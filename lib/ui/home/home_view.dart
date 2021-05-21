import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/ui/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {}),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Center(child: Text(model.currentUser.name!)),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
