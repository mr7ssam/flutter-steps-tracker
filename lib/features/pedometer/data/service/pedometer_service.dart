import 'package:pedometer/pedometer.dart';

import '../../domain/entities/step_model.dart';

class PedometerService {
  // pedometer package returns the steps taken since last system boot.
  // so we use this var for get only new steps
  int _lastCount = 0;

  PedometerService();

  Future<void> init() async {
    _lastCount =
        await Pedometer.stepCountStream.first.then((value) => value.steps);
  }

  Stream<StepModel> get stepCount {
    return Pedometer.stepCountStream.map((event) {
      final stepCount = event.steps - _lastCount;
      _lastCount = event.steps;
      return StepModel(
        count: stepCount,
        timeStamp: event.timeStamp,
      );
    });
  }

  Stream<PedestrianStatus> get pedestrianStatus {
    return Pedometer.pedestrianStatusStream;
  }
}
