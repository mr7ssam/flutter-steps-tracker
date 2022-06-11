import 'package:shared_preferences/shared_preferences.dart';

import '../../common/app_manger/app_manger_bloc.dart';
import '../service_locator.dart';

Future<void> common() async {
  sl.registerSingleton(AppMangerBloc());
}
