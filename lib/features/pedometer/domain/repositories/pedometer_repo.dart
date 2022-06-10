import 'package:pedometer/pedometer.dart';

import '../entities/step_model.dart';

abstract class IPedometerRepo {
  Stream<int> get stepCount;

  Stream<int> get healthPoints;

  int get healthPointsValue;

  Stream<PedestrianStatus> get pedestrianStatusStream;

  void startPedometerListener(String userId);

  void stopListener();

  Future<void> initLocalCount();

  Future<void> addSteps(StepModel newSteps);

  Future<void> updateHealthPoints(int points);
}
