import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/app.locator.dart';
import 'package:votal_app/services/navigation_observer.dart';
import 'package:votal_app/ui/theme/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();
    return MaterialApp.router(
        theme: theme(context),
        routerDelegate: AutoRouterDelegate(
          router,
          navigatorObservers: () => [
            AutoRouteObserver(),
            StackedService.routeObserver,
            MyNavigationObserver(),
          ],
        ),
        routeInformationParser: router.defaultRouteParser());
  }
}
