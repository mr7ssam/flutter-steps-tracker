import 'package:flutter_steps_tracker/common/provider/user_provider.dart';
import 'package:flutter_steps_tracker/features/user/application/facade.dart';
import 'package:flutter_steps_tracker/features/user/data/remote/remote.dart';
import 'package:flutter_steps_tracker/features/user/data/repositories/repo.dart';
import 'package:flutter_steps_tracker/features/user/domain/repositories/repo.dart';
import 'package:flutter_steps_tracker/features/user/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter_steps_tracker/features/user/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter_steps_tracker/features/user/presentation/pages/welcome/welcome/welcome_bloc.dart';

import '../service_locator.dart';

Future<void> user() async {
  sl.registerSingleton(UserRemote());

  sl.registerLazySingleton<IUserRepo>(
    () => UserRepo(userRemote: sl()),
  );

  sl.registerLazySingleton<UserFacade>(
    () => UserFacade(userRepo: sl()),
  );

  sl.registerFactory(() => WelcomeBloc(sl()));

  sl.registerFactory(() => LoginBloc(sl()));

  sl.registerFactory(() => SignUpBloc(sl()));

  sl.registerFactory(() => UserProvider(sl()));
}
