import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepo {
  Future<User> login(Params params);

  Future<User> signUp(Params params);

  Future<void> logout();

  Future<User> signInAnonymously();

  Stream<User?> get userStream;

  User? get user;
}
