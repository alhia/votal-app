import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:votal_app/app/auth_guard.dart';
import 'package:votal_app/ui/create_account/create_account_view.dart';
import 'package:votal_app/ui/create_post/create_post_view.dart';
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
      page: EmptyRouterPage,
      path: '/home',
      name: 'HomeWrapper',
      children: [
        AutoRoute(
          path: '/',
          guards: [AuthGuard],
          page: HomeView,
          children: [
            AutoRoute(page: FeedView, name: 'FeedTab'),
            AutoRoute(page: ProfileView, name: 'ProfileTab'),
          ],
        ),
        AutoRoute(
          path: '/create-post',
          page: CreatePostView,
          name: 'CreatePostModal',
          fullscreenDialog: true,
        ),
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
