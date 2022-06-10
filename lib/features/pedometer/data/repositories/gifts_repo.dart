import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/gifts_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';

import '../../domain/repositories/gifts_repo.dart';

class GiftsRepo extends IGiftsRepo {
  final GiftsRemote _remote;

  GiftsRepo(this._remote);

  @override
  Query giftsQuery() {
    return _remote.giftsQuery();
  }

  @override
  Future<void> bayGift(GiftParams params) {
    return _remote.bay(params);
  }
}
