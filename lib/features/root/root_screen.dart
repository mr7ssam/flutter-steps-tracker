import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:collection/collection.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/common/app_manger/app_manger_bloc.dart';
import 'package:flutter_steps_tracker/features/root/permission_handler_widget.dart';
import 'package:flutter_steps_tracker/features/root/widgets/nav_icon_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/provider/user_provider.dart';
import '../../service_locator/service_locator.dart';
import '../pedometer/presentation/manager/gifts_provider.dart';
import '../pedometer/presentation/manager/pedometer_provider.dart';
import '../pedometer/presentation/pages/gifts_page/gifts_page.dart';
import '../pedometer/presentation/pages/history_page/history_page.dart';
import '../pedometer/presentation/pages/pedometer_page/pedometer_page.dart';
import 'manager/permission_handler_provider.dart';
import 'manager/root_manger.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const path = '/root';
  static const name = 'root_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RootManger(sl())..setContext(context),
          ),
          ChangeNotifierProvider<UserProvider>(
            create: (context) => sl(),
          ),
          ChangeNotifierProvider<PermissionHandlerProvider>(
            create: (context) =>
                PermissionHandlerProvider()..askFormPermission(),
          ),
          ChangeNotifierProvider<PedometerProvider>(
            create: (BuildContext context) => PedometerProvider(sl())..init(),
          ),
          ChangeNotifierProvider<GiftsProvider>(
            create: (BuildContext context) =>
                GiftsProvider(sl())..setBuildContext(context),
          ),
        ],
        child: const RootScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Builder(
        builder: (context) {
          final rootManger = context.watch<RootManger>();
          final selectedIndex = rootManger.pageIndex;
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: Theme.of(context).cardColor,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                rootManger.jump(index);
              },
              destinations: [
                const NavigationDestination(
                  icon: Icon(FontAwesomeIcons.personWalking),
                  selectedIcon: Icon(FontAwesomeIcons.personWalking),
                  label: 'Tracker',
                ),
                const NavigationDestination(
                  icon: Icon(FontAwesomeIcons.clockRotateLeft),
                  selectedIcon: Icon(FontAwesomeIcons.clockRotateLeft),
                  label: 'History',
                ),
                const NavigationDestination(
                  icon: Icon(FontAwesomeIcons.bagShopping),
                  selectedIcon: Icon(FontAwesomeIcons.bagShopping),
                  label: '',
                ),
              ]
                  .mapIndexed((index, element) => NavigationPlayAnimation(
                        index: index,
                        child: element,
                        selectedIndex: selectedIndex,
                      ))
                  .toList(),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Steps Tracker'),
        actions: [
          _buildThemeButton(context),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              return value.user.isAnonymous
                  ? TextButton(
                      onPressed: () {
                        _onLoginLogoutAction(context);
                      },
                      child: const Text('Login?'))
                  : IconButton(
                      onPressed: () {
                        _onLoginLogoutAction(context);
                      },
                      icon: const Icon(
                        PIcons.outline_logout,
                      ),
                    );
            },
          ),
        ],
      ),
      body: PageView(
        controller: context.read<RootManger>().pageController,
        children: [
          PermissionHandlerWidget(builder: (context) => const PedometerPage()),
          const HistoryPage(),
          const GiftsPage(),
        ].map((e) => KeepAliveWidget(child: e)).toList(),
      ),
    );
  }

  void _onLoginLogoutAction(BuildContext context) {
    context.read<AppMangerBloc>().add(AppMangerLoggedOut());
  }

  IconButton _buildThemeButton(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return IconButton(
        iconSize: 24.r,
        onPressed: () => _onChangeTheme(context, brightness),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            child = ScaleTransition(
              scale: animation,
              child: child,
            );
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
          child: Icon(
            brightness == Brightness.light
                ? Icons.nightlight_round_outlined
                : Icons.wb_sunny_outlined,
            key: Key(brightness.index.toString()),
          ),
        ));
  }

  void _onChangeTheme(BuildContext context, Brightness brightness) {
    if (brightness == Brightness.dark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }
}
