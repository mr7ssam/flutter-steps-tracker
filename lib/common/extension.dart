import 'package:pedometer/pedometer.dart';

extension PedestrianStatusExt on PedestrianStatus? {
  bool get isWalking => this?.status == 'walking';
}
