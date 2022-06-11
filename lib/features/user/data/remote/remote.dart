import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/features/user/domain/params/login_params.dart';
import 'package:flutter_steps_tracker/features/user/domain/params/sing_up_params.dart';

class UserRemote {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> login(LoginParams loginParams) {
    return throwAppException(
      () {
        return _firebaseAuth.signInWithEmailAndPassword(
          password: loginParams.password,
          email: loginParams.email,
        );
      },
    );
  }

  Future<UserCredential> signInAnonymously() {
    return throwAppException(
      () {
        return _firebaseAuth.signInAnonymously();
      },
    );
  }

  Future<UserCredential> signUp(
    SignUpParams signUpParams, {
    bool isAnonymous = false,
  }) {
    return throwAppException(
      () async {
        late final UserCredential result;
        if (isAnonymous) {
          result = await _linkWithCredential(signUpParams);
        } else {
          result = await _firebaseAuth.createUserWithEmailAndPassword(
            email: signUpParams.email,
            password: signUpParams.password,
          );
        }
        await _firebaseAuth.currentUser!.updateDisplayName(signUpParams.name);
        return result;
      },
    );
  }

  Future<void> logout() {
    return throwAppException(
      () {
        return _firebaseAuth.signOut();
      },
    );
  }

  Future<UserCredential> _linkWithCredential(
    SignUpParams signUpParams,
  ) async {
    final credential = EmailAuthProvider.credential(
      email: signUpParams.email,
      password: signUpParams.password,
    );
    final result = await _firebaseAuth.currentUser!.linkWithCredential(
      credential,
    );
    return result;
  }
}
