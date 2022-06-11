import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';

import '../entities/gift_model.dart';

abstract class IGiftsRepo {
  Stream<List<GiftModel>> giftsStream();
  Future<void> bayGift(GiftParams params);
}
