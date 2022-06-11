import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/history_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/repositories/history_repo.dart';

import '../../domain/entities/health_record_model.dart';
import '../../domain/entities/redeem_model.dart';
import '../../domain/entities/user_counter_model.dart';

class HistoryRepo extends IHistoryRepo {
  final HistoryRemote _remote;

  HistoryRepo(this._remote);

  @override
  Stream<List<HealthRecordModel>> healthPointsAwardsHistory(String userId) {
    return _remote.healthPointsQuery(userId).snapshots().map(
          (event) => event.docs
              .map(
                (e) =>
                    HealthRecordModel.fromMap(e.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }

  @override
  Stream<List<RedeemModel>> redeemsHistory(String userId) {
    return _remote.redeemsQuery(userId).snapshots().map(
          (event) => event.docs
              .map(
                (e) => RedeemModel.fromMap(e.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }

  @override
  Stream<HealthRecordModel> healthPointsAwardsChanges(String userId) {
    return _remote
        .healthPointsQuery(userId)
        .snapshots()
        // skip first snapshot, all documents will be in the list as Added changes.
        .skip(1)
        .expand((element) => element.docChanges)
        .where((element) => element.type == DocumentChangeType.added)
        .map(
          (event) => HealthRecordModel.fromMap(
              event.doc.data() as Map<String, dynamic>),
        );
  }

  @override
  Stream<List<UserCounterModel>> usersRankStream() {
    return _remote.userRankQuery().snapshots().map(
          (event) => event.docs
              .map(
                (e) =>
                    UserCounterModel.fromMap(e.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }
}
