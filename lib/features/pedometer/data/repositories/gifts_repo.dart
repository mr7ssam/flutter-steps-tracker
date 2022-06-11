import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/gifts_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';

import '../../domain/entities/gift_model.dart';
import '../../domain/repositories/gifts_repo.dart';

class GiftsRepo extends IGiftsRepo {
  final GiftsRemote _remote;

  GiftsRepo(this._remote);

  @override
  Stream<List<GiftModel>> giftsStream() {
    return _remote.giftsQuery().snapshots().map(
          (event) => event.docs
              .map(
                (e) => GiftModel.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> bayGift(GiftParams params) {
    return _remote.bay(params);
  }
}
