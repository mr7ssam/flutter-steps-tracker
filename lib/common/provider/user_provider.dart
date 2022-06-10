import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../features/user/application/facade.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._userFacade) {
    _init();
  }

  final UserFacade _userFacade;

  late final StreamSubscription<User?> _streamSubscription;

  late User _user;

  void _init() {
    user = _userFacade.user!;
    _streamSubscription = _userFacade.userStream.listen(_listener);
  }

  void _listener(event) {
    if (event != null) {
      user = event;
    }
  }

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
