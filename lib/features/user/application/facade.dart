import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/features/user/domain/repositories/repo.dart';

class UserFacade {
  final IUserRepo _userRepo;

  UserFacade({required IUserRepo userRepo}) : _userRepo = userRepo;

  Future<ApiResult<User>> login(Params params) {
    return toApiResult(() => _userRepo.login(params));
  }

  Future<void> logout() {
    return _userRepo.logout();
  }

  Future<ApiResult<void>> signUp(Params params) {
    return toApiResult(() => _userRepo.signUp(params));
  }

  Future<ApiResult<User>> signInAnonymously(String userName) async {
    return toApiResult(
      () => _userRepo.signInAnonymously().then(
        (value) async {
          await value.updateDisplayName(userName);
          return value;
        },
      ),
    );
  }

  User? get user => _userRepo.user;

  Stream<User?> get userStream => _userRepo.userStream;

  bool get isAnonymous => user?.isAnonymous ?? false;
}
