import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/pedometer/application/facade.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/gift_model.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';

class GiftsProvider extends ChangeNotifier {
  final PedometerFacade facade;

  GiftsProvider(this.facade);

  late final BuildContext _context;

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  Future<void> bay(GiftModel giftModel) async {
    ScaffoldMessenger.of(_context).removeCurrentSnackBar();
    if (facade.healthPointsValue < giftModel.price) {
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          content: Text('No enough HP!, you should walking more'),
        ),
      );
    } else {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(
              'You bought a ${giftModel.name} and spent ${giftModel.price} HP'),
        ),
      );
      await facade.bayGift(
        GiftParams(giftModel: giftModel),
      );
    }
  }
}
