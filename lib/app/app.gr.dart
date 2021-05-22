// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../ui/create_account/create_account_view.dart' as _i6;
import '../ui/feed/feed_view.dart' as _i8;
import '../ui/home/home_view.dart' as _i7;
import '../ui/login/login_view.dart' as _i5;
import '../ui/profile/profile_view.dart' as _i9;
import '../ui/startup/startup_view.dart' as _i4;
import 'auth_guard.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    StartUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.StartUpView();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
          return _i5.LoginView(key: args.key);
        }),
    CreateAccountRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CreateAccountRouteArgs>(
              orElse: () => const CreateAccountRouteArgs());
          return _i6.CreateAccountView(key: args.key);
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.HomeView();
        }),
    FeedTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.FeedView();
        }),
    ProfileTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.ProfileView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(StartUpRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-view'),
        _i1.RouteConfig(CreateAccountRoute.name, path: '/create-account-view'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-view', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig(FeedTab.name, path: 'feed-view'),
          _i1.RouteConfig(ProfileTab.name, path: 'profile-view')
        ])
      ];
}

class StartUpRoute extends _i1.PageRouteInfo {
  const StartUpRoute() : super(name, path: '/');

  static const String name = 'StartUpRoute';
}

class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i2.Key? key})
      : super(name, path: '/login-view', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i2.Key? key;
}

class CreateAccountRoute extends _i1.PageRouteInfo<CreateAccountRouteArgs> {
  CreateAccountRoute({_i2.Key? key})
      : super(name,
            path: '/create-account-view',
            args: CreateAccountRouteArgs(key: key));

  static const String name = 'CreateAccountRoute';
}

class CreateAccountRouteArgs {
  const CreateAccountRouteArgs({this.key});

  final _i2.Key? key;
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/home-view', initialChildren: children);

  static const String name = 'HomeRoute';
}

class FeedTab extends _i1.PageRouteInfo {
  const FeedTab() : super(name, path: 'feed-view');

  static const String name = 'FeedTab';
}

class ProfileTab extends _i1.PageRouteInfo {
  const ProfileTab() : super(name, path: 'profile-view');

  static const String name = 'ProfileTab';
}
