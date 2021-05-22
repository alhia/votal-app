import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/ui/home/home_viewmodel.dart';

class HomeView extends StatelessWidget with AutoRouteAware {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {}),
      builder: (context, model, child) => AutoTabsScaffold(
        
        appBarBuilder: (_, tabsRouter) => AppBar(
          title: Text(context.topRoute.name),
        ),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mic),
        ),
        routes: [FeedTab(), ProfileTab()],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBuilder:
            (BuildContext context, TabsRouter tabsRouter) => BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          clipBehavior: Clip.hardEdge,
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
