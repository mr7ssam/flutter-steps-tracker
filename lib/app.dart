import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_steps_tracker/common/provider/app_providers.dart';
import 'package:flutter_steps_tracker/common/provider/local_provider.dart';
import 'package:flutter_steps_tracker/common/provider/theme_provider.dart';
import 'package:flutter_steps_tracker/router/router.dart';

import 'package:provider/provider.dart';

import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialProviders(
      builder: (context) {
        final appRouter = context.read<AppRouter>();
        final themeWatcher = context.watch<ThemeProvider>();
        final localeWatcher = context.watch<LocalizationProvider>();
        return ScreenUtilInit(
          builder: (context, _) => MaterialApp.router(
            routeInformationParser: appRouter.goRouter.routeInformationParser,
            routerDelegate: appRouter.goRouter.routerDelegate,
            title: 'Flutter Steps Tracker',
            themeMode: themeWatcher.themeMode,
            theme: lightTheme,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: localeWatcher.local,
            supportedLocales: S.delegate.supportedLocales,
            darkTheme: darkTheme,
            builder: (context, child) {
              return fontBuilder(context, child);
            },
          ),
        );
      },
    );
  }
}
