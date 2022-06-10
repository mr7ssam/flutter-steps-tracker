import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/features/user/presentation/pages/login/login.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart';
import 'package:go_router/go_router.dart';

import '../sign_up/sign_up.dart';
import 'welcome/welcome_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  static const path = '/welcome';
  static const name = 'welcome';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider<WelcomeBloc>(
        create: (context) => sl(),
        child: const WelcomeScreen(),
      ),
    );
  }

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonWidthFactor = 0.55;

    final theme = Theme.of(context);
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                context.read<WelcomeBloc>().add(WelcomeSignInSkipped(context));
              },
              child: const Text('Skip'),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Icon(Icons.flutter_dash_rounded,
                    size: 100.r, color: theme.colorScheme.primary),
                const RSizedBox.vertical(32),
                const YouText.titleLarge('Flutter Steps Tracker'),
              ],
            ),
            BlocBuilder<WelcomeBloc, WelcomeState>(
              builder: (context, state) {
                if (state is WelcomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: buttonWidthFactor,
                      child: FilledButton(
                        onPressed: () => _onSignUpPressed(context),
                        child: const Text('Sign Up'),
                      ),
                    ),
                    Space.vS3,
                    FractionallySizedBox(
                      widthFactor: buttonWidthFactor,
                      child: OutlinedButton(
                        onPressed: () => _onLoginPressed(context),
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, WelcomeState state) {
    if (state is WelcomeFailure) {
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(state.message)));
    } else if (state is WelcomeLoading) {
    } else if (state is WelcomeSuccess) {}
  }

  void _onLoginPressed(BuildContext context) {
    context.goNamed(LoginScreen.name);
  }

  void _onSignUpPressed(BuildContext context) {
    context.goNamed(SignUpScreen.name);
  }
}
