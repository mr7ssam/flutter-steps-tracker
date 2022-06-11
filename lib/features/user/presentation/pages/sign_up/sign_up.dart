import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart';
import 'package:go_router/go_router.dart';

import 'bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const path = 'sign_up';
  static const name = 'sign_up';

  const SignUpScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider<SignUpBloc>(
          create: (context) => sl(), child: const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();
    final s = S.of(context);
    return BlocListener<SignUpBloc, SignUpState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: ReactiveForm(
          formGroup: signUpBloc.form,
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
                  YouText.headlineSmall(
                    s.welcome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const RSizedBox.vertical(16),
                  KeyboardVisibilityBuilder(
                    closed: () => const RSizedBox.vertical(64),
                    open: () => const RSizedBox.vertical(16),
                  ),
                  CustomReactiveTextField(
                    hintText: s.enter_name,
                    prefix: Icons.account_circle_outlined,
                    validationMessages: (control) => {
                      ValidationMessage.email: s.email_validation,
                      ValidationMessage.required: s.required_validation,
                    },
                    formControlName: SignUpBloc.nameControllerName,
                    keyboardType: TextInputType.name,
                  ),
                  const RSizedBox.vertical(16),
                  CustomReactiveTextField(
                    hintText: s.enter_email,
                    prefix: Icons.email_outlined,
                    validationMessages: (control) => {
                      ValidationMessage.email: s.email_validation,
                      ValidationMessage.required: s.required_validation,
                    },
                    formControlName: SignUpBloc.emailControllerName,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const RSizedBox.vertical(16),
                  CustomReactiveTextField(
                    obscureText: true,
                    hintText: s.enter_password,
                    prefix: Icons.lock_open_outlined,
                    formControlName: SignUpBloc.passwordControllerName,
                    validationMessages: (control) => {
                      ValidationMessage.required: s.required_validation,
                    },
                  ),
                  KeyboardVisibilityBuilder(
                    closed: () => const RSizedBox.vertical(64),
                    open: () => const RSizedBox.vertical(24),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return FilledButton(
                        onPressed: () {
                          signUpBloc.add(SignUpSubmitted());
                        },
                        child: Text(s.sign_up),
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

  void _listener(BuildContext context, SignUpState state) {
    if (state is SignUpFailure) {
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      scaffoldMessengerState.removeCurrentSnackBar();
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(state.message)));
    } else if (state is SignUpLoading) {
    } else if (state is SignUpSuccess) {}
  }
}
