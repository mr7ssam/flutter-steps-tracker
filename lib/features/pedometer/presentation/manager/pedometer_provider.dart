import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/common/extension.dart';
import 'package:pedometer/pedometer.dart';

import '../../application/facade.dart';

class PedometerProvider extends ChangeNotifier {
  final PedometerFacade facade;

  PedometerProvider(this.facade)
      : _loading = true,
        _walking = false,
        _pedestrianStatus = null,
        _count = 0,
        _healthPoints = 0;

  void init() async {
    loading = true;

    await facade.startPedometerListener();

    facade.stepCount.listen((event) {
      count = event;
    });

    facade.pedestrianStatusStream.listen((event) {
      pedestrianStatus = event;
      walking = pedestrianStatus.isWalking;
    });

    facade.healthPoints.listen((event) {
      healthPoints = event;
    });

    loading = false;
  }

  int _count;

  int get count => _count;

  set count(int count) {
    _count = count;
    notifyListeners();
  }

  int _healthPoints;

  int get healthPoints => _healthPoints;

  set healthPoints(int healthPoints) {
    _healthPoints = healthPoints;
    notifyListeners();
  }

  bool _loading;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  // used for error handling, maybe in future
  PedestrianStatus? _pedestrianStatus;

  PedestrianStatus? get pedestrianStatus => _pedestrianStatus;

  set pedestrianStatus(PedestrianStatus? pedestrianStatus) {
    _pedestrianStatus = pedestrianStatus;
    notifyListeners();
  }

  bool _walking;

  bool get walking => _walking;

  set walking(bool walking) {
    _walking = walking;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    facade.stopListener();
  }
}
