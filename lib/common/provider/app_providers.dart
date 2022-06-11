import 'dart:async';
import 'package:timeago/timeago.dart' as timeago;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/common/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart'
    as sl;
import '../../firebase_options.dart';
import '../../router/router.dart';
import '../app_manger/app_manger_bloc.dart';
import 'local_provider.dart';

class AppMaterialProviders extends StatelessWidget {
  final WidgetBuilder builder;

  const AppMaterialProviders({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => AppMangerBloc(
            doBeforeOpen: _doBeforeOpen,
          )..add(AppMangerStarted()),
        ),
        Provider<AppRouter>(
          create: (context) => AppRouter(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            sl.sl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalizationProvider(
            sl.sl(),
          ),
        ),
      ],
      builder: (context, _) => builder(context),
    );
  }

  FutureOr<void> _doBeforeOpen() async {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar', timeago.ArShortMessages());
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await sl.init();
  }
}
