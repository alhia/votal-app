import 'package:auto_route/annotations.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:votal_app/ui/create_account/create_account_view.dart';
import 'package:votal_app/ui/feed/feed_view.dart';
import 'package:votal_app/ui/home/home_view.dart';
import 'package:votal_app/ui/login/login_view.dart';
import 'package:votal_app/ui/profile/profile_view.dart';
import 'package:votal_app/ui/startup/startup_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(page: StartUpView, initial: true),
    AutoRoute(page: LoginView),
    AutoRoute(page: CreateAccountView),
    AutoRoute(
      page: HomeView,
      children: [
        AutoRoute(page: FeedView),
        AutoRoute(page: ProfileView),
      ],
    ),
  ],
)
class $AppRouter {}

@StackedApp(
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
