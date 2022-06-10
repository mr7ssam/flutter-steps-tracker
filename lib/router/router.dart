import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../common/app_manger/app_manger_bloc.dart';
import 'routes.dart';

class AppRouter {
  AppRouter({
    required this.context,
  }) {
    goRouter = GoRouter(
      routes: _routes,
      initialLocation: SplashScreen.path,
      redirect: (state) => _rootRedirect(context, state),
      refreshListenable:
          GoRouterRefreshStream(context.read<AppMangerBloc>().stream),
    );
  }

  final BuildContext context;

  late final GoRouter goRouter;

  late final _routes = [
    GoRoute(
      path: SplashScreen.path,
      name: SplashScreen.name,
      pageBuilder: SplashScreen.pageBuilder,
    ),
    GoRoute(
      path: RootScreen.path,
      name: RootScreen.name,
      pageBuilder: RootScreen.pageBuilder,
    ),
    GoRoute(
      path: WelcomeScreen.path,
      name: WelcomeScreen.name,
      pageBuilder: WelcomeScreen.pageBuilder,
      routes: [
        GoRoute(
          path: LoginScreen.path,
          name: LoginScreen.name,
          pageBuilder: LoginScreen.pageBuilder,
        ),
        GoRoute(
          path: SignUpScreen.path,
          name: SignUpScreen.name,
          pageBuilder: SignUpScreen.pageBuilder,
        ),
      ],
    ),
  ];

  _rootRedirect(BuildContext context, GoRouterState state) {
    final appState = context.read<AppMangerBloc>().state;
    final goingToWelcome = !(state.location.contains(WelcomeScreen.path));
    if (goingToWelcome && appState.state == AppState.unAuthenticated) {
      return WelcomeScreen.path;
    }
    final goingToHome = !(state.location.contains(RootScreen.path));
    if (goingToHome && appState.state == AppState.authenticated) {
      return RootScreen.path;
    }
    return null;
  }

  static AppRouter of(BuildContext context) {
    return Provider.of<AppRouter>(context, listen: false);
  }
}
