import 'dart:async';

import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

import '../../../../../../common/app_manger/app_manger_bloc.dart';
import '../../../../application/facade.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(
    this._userFacade,
  ) : super(WelcomeInitial()) {
    on<WelcomeEvent>(_handler);
  }

  final UserFacade _userFacade;

  FutureOr<void> _handler(
    WelcomeEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    if (event is WelcomeSignInSkipped) {
      if (!_userFacade.isAnonymous) {
        await enterNameDialog(event.context, emit);
      } else {
        event.context
            .read<AppMangerBloc>()
            .add(const AppMangerStateChanged(state: AppState.authenticated));
      }
    }
  }

  Future enterNameDialog(
      BuildContext context, Emitter<WelcomeState> emit) async {
    final control = FormControl(validators: [Validators.required]);
    final result = await showDialog(
        context: context,
        builder: (context) {
          final s = S.of(context);
          return Dialog(
            child: RPadding(
              padding: PEdgeInsets.listView,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YouText.titleLarge(
                    s.login,
                  ),
                  Space.vM3,
                  YouText.bodyMedium(
                    s.enter_email,
                  ),
                  Space.vM3,
                  CustomReactiveTextField(
                    labelText: s.enter_name,
                    hintText: s.enter_name,
                    formControl: control,
                  ),
                  Space.vM3,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(s.cancel),
                        ),
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            await _onConfirm(control, context, emit);
                          },
                          child: Text(s.continue_t),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
    if (result ?? false) {
      emit(WelcomeLoading());
      final result = await _userFacade.signInAnonymously(control.value);

      result.when(
        success: (data) => emit(WelcomeSuccess()),
        failure: (message, _) => emit(WelcomeFailure(message)),
      );
    }
  }

  Future<void> _onConfirm(FormControl<dynamic> control, BuildContext context,
      Emitter<WelcomeState> emit) async {
    if (control.isValid()) {
      Navigator.pop(context, true);
    }
  }
}
