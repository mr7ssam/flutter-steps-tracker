import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/features/user/application/facade.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart';
import 'package:meta/meta.dart';

part 'app_manger_event.dart';

part 'app_manger_state.dart';

class AppMangerBloc extends Bloc<AppMangerEvent, AppMangerState> {
  AppMangerBloc({this.doBeforeOpen}) : super(const AppMangerState.initial()) {
    on<AppMangerEvent>(_handler);
    stream.listen((event) {
      log(event.toString());
    });
  }

  late final StreamSubscription<User?> _streamSubscription;

  late final UserFacade _facade;
  final FutureOr<void> Function()? doBeforeOpen;

  FutureOr<void> _handler(
      AppMangerEvent event, Emitter<AppMangerState> emit) async {
    if (event is AppMangerStarted) {
      await _mapAppStarted();
    } else if (event is AppMangerStateChanged) {
      emit(state.copyWith(state: event.state));
    } else if (event is AppMangerLoggedOut) {
      await _mapLoggedOut();
    }
  }

  Future<void> _mapAppStarted() async {
    final delay = Future.delayed(const Duration(seconds: 2));
    await doBeforeOpen?.call();
    await delay;
    _facade = sl();
    _streamSubscription = _facade.userStream.listen(_userListener);
  }

  Future<void> _mapLoggedOut() async {
    // save user id for future linking
    if (!_facade.isAnonymous) {
      await _facade.logout();
    } else {
      add(const AppMangerStateChanged(state: AppState.unAuthenticated));
    }
  }

  void _userListener(User? user) {
    late final AppState newState;
    if (user == null) {
      newState = AppState.unAuthenticated;
    } else {
      newState = AppState.authenticated;
    }
    add(AppMangerStateChanged(state: newState));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
