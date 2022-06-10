import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:design/design.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/router/router.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart'
    as si;
import 'package:provider/provider.dart';

import 'common/app_manger/app_manger_bloc.dart';
import 'firebase_options.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMangerBloc(
        doBeforeOpen: _doBeforeOpen,
      )..add(AppMangerStarted()),
      child: Provider<AppRouter>(
        create: (context) => AppRouter(context: context),
        builder: (context, _) {
          var appRouter = context.read<AppRouter>();
          return ScreenUtilInit(
            builder: (theme, dark) => AdaptiveTheme(
              light: lightTheme,
              dark: darkTheme,
              builder: (lightTheme, darkTheme) => MaterialApp.router(
                routeInformationParser:
                    appRouter.goRouter.routeInformationParser,
                routerDelegate: appRouter.goRouter.routerDelegate,
                title: 'Flutter Login Demo',
                theme: lightTheme,
                darkTheme: darkTheme,
                builder: (context, child) {
                  return fontBuilder(context, child);
                },
              ),
              initial: AdaptiveThemeMode.system,
            ),
          );
        },
      ),
    );
  }

  FutureOr<void> _doBeforeOpen() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await si.init();
  }
}
