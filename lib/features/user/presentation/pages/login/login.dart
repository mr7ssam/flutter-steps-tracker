import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const path = 'login';
  static const name = 'login_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider<LoginBloc>(
          create: (context) => sl(), child: const LoginScreen()),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: ReactiveForm(
          formGroup: loginBloc.form,
          child: SingleChildScrollView(
            child: RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyboardVisibilityBuilder(
                    closed: () => const RSizedBox.vertical(64),
                    open: () => const RSizedBox.vertical(16),
                  ),
                  const YouText.headlineSmall(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const RSizedBox.vertical(16),
                  KeyboardVisibilityBuilder(
                    closed: () => const RSizedBox.vertical(64),
                    open: () => const RSizedBox.vertical(16),
                  ),
                  CustomReactiveTextField(
                    hintText: 'Enter a email',
                    prefix: Icons.email_outlined,
                    validationMessages: (control) => {
                      ValidationMessage.email: 'Enter a valid email!',
                      ValidationMessage.required: 'Required',
                    },
                    formControlName: LoginBloc.emailControllerName,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const RSizedBox.vertical(16),
                  CustomReactiveTextField(
                    obscureText: true,
                    hintText: 'Enter a password',
                    prefix: Icons.lock_open_outlined,
                    formControlName: LoginBloc.passwordControllerName,
                    validationMessages: (control) => {
                      ValidationMessage.email: 'Enter a valid email!',
                      ValidationMessage.required: 'Required',
                    },
                  ),
                  KeyboardVisibilityBuilder(
                    closed: () => const RSizedBox.vertical(64),
                    open: () => const RSizedBox.vertical(16),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return FilledButton(
                        onPressed: () {
                          _onLoginPressed(context);
                        },
                        child: const Text('Login'),
                      );
                    },
                  ),
                  const RSizedBox.vertical(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginFailure) {
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }
}
