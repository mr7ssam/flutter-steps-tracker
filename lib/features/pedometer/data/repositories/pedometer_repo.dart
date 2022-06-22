import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/service/pedometer_service.dart';
import 'package:pedometer/pedometer.dart';

import '../../domain/entities/step_model.dart';
import '../../domain/repositories/pedometer_repo.dart';
import '../remote/data_sources/pedometer_remote.dart';

class PedometerRepo extends IPedometerRepo {
  PedometerRepo(this.pedometerService, this.pedometerRemote);

  final PedometerService pedometerService;
  final PedometerRemote pedometerRemote;

  late User _user;

  late int _healthPointsValue;

  String get _useId => _user.uid;

  StreamSubscription<StepModel>? _subscription;

  @override
  Stream<PedestrianStatus> get pedestrianStatusStream =>
      pedometerService.pedestrianStatus;

  @override
  Stream<int> get stepCount => pedometerRemote.todayCountStream(_useId);

  @override
  Stream<int> get healthPoints => pedometerRemote.healthPointStream(_useId).map(
        (event) {
          return _healthPointsValue = event;
        },
      );

  @override
  int get healthPointsValue => _healthPointsValue;

  @override
  Future<void> initLocalCount() async {
    await pedometerService.init();
  }

  @override
  void startPedometerListener(User user) {
    _user = user;
    pedometerRemote.user = _user;
    _subscription ??= pedometerService.newSteps.listen((event) async {
      await addSteps(event);
    });
  }

  @override
  Future<void> addSteps(StepModel newSteps) async {
    return pedometerRemote.addSteps(newSteps);
  }

  @override
  Future<void> updateHealthPoints(int points) {
    return pedometerRemote.updateHealthPoints(points);
  }

  @override
  void stopListener() {
    _subscription?.cancel();
    _subscription = null;
  }
}
