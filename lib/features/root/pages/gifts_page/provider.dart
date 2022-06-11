import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../pedometer/application/facade.dart';
import '../../../pedometer/domain/entities/gift_model.dart';
import '../../../pedometer/domain/params/bay_gift_params.dart';

class GiftsProvider extends ChangeNotifier {
  final PedometerFacade _facade;

  GiftsProvider(this._facade) : _gifts = [] {
    _subscription = _facade.giftsStream().listen((event) {
      gifts = event;
    });
  }

  late final BuildContext _context;

  late StreamSubscription _subscription;

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  List<GiftModel> _gifts;

  List<GiftModel> get gifts => _gifts;

  set gifts(List<GiftModel> gifts) {
    _gifts = gifts;
    notifyListeners();
  }

  Future<void> bay(GiftModel giftModel) async {
    ScaffoldMessenger.of(_context).removeCurrentSnackBar();
    final s = S.of(_context);
    if (_facade.healthPointsValue < giftModel.price) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(s.now_enough_hp),
        ),
      );
    } else {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(s.redeems_title(giftModel.price, giftModel.name)),
        ),
      );
      await _facade.bayGift(
        GiftParams(giftModel: giftModel),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
