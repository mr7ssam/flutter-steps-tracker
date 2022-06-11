import 'dart:async';

import 'package:flutter/material.dart';

import '../../../pedometer/application/facade.dart';
import '../../../pedometer/domain/entities/user_counter_model.dart';

class RankProvider extends ChangeNotifier {
  RankProvider(this._facade) : _usersRank = [] {
    _usersRankSubscription = _facade.usersRankStream().listen((event) {
      usersRank = event;
    });
  }

  final PedometerFacade _facade;

  late StreamSubscription _usersRankSubscription;

  List<UserCounterModel> _usersRank;

  List<UserCounterModel> get usersRank => _usersRank;

  set usersRank(List<UserCounterModel> usersRank) {
    _usersRank = usersRank;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _usersRankSubscription.cancel();
  }
}
