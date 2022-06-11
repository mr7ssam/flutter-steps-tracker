import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/health_record_model.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/redeem_model.dart';

import '../../../pedometer/application/facade.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider(this._facade)
      : _healthRecords = [],
        _redeemsRecords = [] {
    _healthPointsAwardsHistorySubscription =
        _facade.healthPointsAwardsHistory().listen((event) {
      healthRecords = event;
    });

    _redeemsHistorySubscription = _facade.redeemsHistory().listen((event) {
      redeemsRecords = event;
    });
  }

  final PedometerFacade _facade;

  late StreamSubscription _healthPointsAwardsHistorySubscription;
  late StreamSubscription _redeemsHistorySubscription;

  List<HealthRecordModel> _healthRecords;

  List<HealthRecordModel> get healthRecords => _healthRecords;

  set healthRecords(List<HealthRecordModel> healthRecords) {
    _healthRecords = healthRecords;
    notifyListeners();
  }

  List<RedeemModel> _redeemsRecords;

  List<RedeemModel> get redeemsRecords => _redeemsRecords;

  set redeemsRecords(List<RedeemModel> redeemsRecords) {
    _redeemsRecords = redeemsRecords;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _healthPointsAwardsHistorySubscription.cancel();
    _redeemsHistorySubscription.cancel();
  }
}
