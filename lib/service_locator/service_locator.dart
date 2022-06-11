import 'package:get_it/get_it.dart';

import 'features/_export.dart';

final sl = GetIt.I;

Future<void> init() async {
  await common();
  await user();
  pedometer();
}
