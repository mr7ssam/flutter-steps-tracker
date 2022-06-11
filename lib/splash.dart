import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'generated/l10n.dart';
import 'generated/resources/resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const path = '/splash';
  static const name = 'splash_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                LottieAssets.walking,
              ),
              YouText.titleLarge(S.of(context).app_splash_title),
            ],
          ),
        ),
      ),
    );
  }
}
