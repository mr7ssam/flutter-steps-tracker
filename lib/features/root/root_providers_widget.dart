import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/root/pages/history_page/provider.dart';
import 'package:flutter_steps_tracker/features/root/pages/rank_page/provider.dart';
import 'package:provider/provider.dart';

import '../../common/provider/user_provider.dart';
import '../../service_locator/service_locator.dart';
import 'manager/mangers.dart';
import 'pages/gifts_page/provider.dart';

class RootProvidersWidget extends StatelessWidget {
  final Widget root;
  const RootProvidersWidget({Key? key, required this.root}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RootManger(sl())..setContext(context),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => sl(),
        ),
        ChangeNotifierProvider<PermissionHandlerProvider>(
          create: (context) => PermissionHandlerProvider()..askFormPermission(),
        ),
        ChangeNotifierProvider<PedometerProvider>(
          create: (BuildContext context) => PedometerProvider(sl())..start(),
        ),
        ChangeNotifierProvider<GiftsProvider>(
          create: (BuildContext context) =>
              GiftsProvider(sl())..setBuildContext(context),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryProvider(sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => RankProvider(sl()),
        ),
      ],
      child: root,
    );
  }
}
