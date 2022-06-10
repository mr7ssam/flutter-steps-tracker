import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';

abstract class IGiftsRepo {
  Query giftsQuery();
  Future<void> bayGift(GiftParams params);
}
