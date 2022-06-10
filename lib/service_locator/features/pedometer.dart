import 'package:flutter_steps_tracker/features/pedometer/application/facade.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/gifts_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/history_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/pedometer_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/repositories/gifts_repo.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/repositories/history_repo.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/repositories/pedometer_repo.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/service/pedometer_service.dart';
import 'package:flutter_steps_tracker/service_locator/service_locator.dart';

import '../../features/pedometer/domain/repositories/gifts_repo.dart';
import '../../features/pedometer/domain/repositories/history_repo.dart';
import '../../features/pedometer/domain/repositories/pedometer_repo.dart';

void pedometer() {
  sl.registerSingleton(PedometerService());
  sl.registerSingleton(PedometerRemote());
  sl.registerSingleton<IPedometerRepo>(
    PedometerRepo(sl(), sl()),
  );

  sl.registerSingleton(HistoryRemote());
  sl.registerSingleton<IHistoryRepo>(HistoryRepo(sl()));

  sl.registerSingleton(GiftsRemote());
  sl.registerSingleton<IGiftsRepo>(GiftsRepo(sl()));

  sl.registerSingleton(PedometerFacade(sl(), sl(), sl(), sl()));
}
