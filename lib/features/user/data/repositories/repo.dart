import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/features/user/data/remote/remote.dart';
import 'package:flutter_steps_tracker/features/user/domain/params/login_params.dart';
import 'package:flutter_steps_tracker/features/user/domain/params/sing_up_params.dart';
import 'package:flutter_steps_tracker/features/user/domain/repositories/repo.dart';

class UserRepo implements IUserRepo {
  final UserRemote _userRemote;

  UserRepo({required UserRemote userRemote}) : _userRemote = userRemote;

  @override
  Future<User> login(Params params) {
    return _userRemote
        .login(params as LoginParams)
        .then((value) => value.user!);
  }

  @override
  Future<User> signUp(Params params) {
    return _userRemote
        .signUp(params as SignUpParams)
        .then((value) => value.user!);
  }

  @override
  Future<User> signInAnonymously() {
    return _userRemote.signInAnonymously().then((value) => value.user!);
  }

  @override
  Future<void> logout() {
    return _userRemote.logout();
  }

  @override
  User? get user => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> get userStream => FirebaseAuth.instance.userChanges();
}
