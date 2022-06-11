import 'dart:async';

import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

import '../../pedometer/application/facade.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/health_record_model.dart';

class RootManger extends ChangeNotifier {
  final PedometerFacade _facade;
  late final BuildContext _context;
  late StreamSubscription _subscription;
  final PageController pageController = PageController(initialPage: 0);

  RootManger(this._facade) {
    _init();
  }

  void setContext(BuildContext context) => _context = context;

  void _init() {
    pageController.addListener(_listener);
    _subscription = _facade.healthPointsAwardsChanges().listen((event) {
      _healthAwardsListener(event);
    });
  }

  void _healthAwardsListener(HealthRecordModel event) {
    final s = S.of(_context);
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Row(
      children: [
        const Icon(Icons.local_fire_department, color: Colors.orange),
        Space.hM1,
        Text(s.keep_moving(event.points)),
        if (event.big) ...[
          const Spacer(),
          Text(s.big_one, style: const TextStyle(color: Colors.orange)),
        ]
      ],
    )));
  }

  void _listener() {
    pageIndex = pageController.page!.round();
  }

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  void jump(int index) {
    pageController.jumpToPage(index);
    pageIndex = index;
  }

  @override
  void dispose() {
    _subscription.cancel();
    pageController.dispose();
    super.dispose();
  }
}
