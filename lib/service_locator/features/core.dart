import '../../common/app_manger/app_manger_bloc.dart';
import '../service_locator.dart';

Future<void> core() async {
  sl.registerSingleton(AppMangerBloc());
}
