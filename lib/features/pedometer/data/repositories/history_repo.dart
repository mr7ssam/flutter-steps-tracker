import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/features/pedometer/data/remote/data_sources/history_remote.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/repositories/history_repo.dart';

import '../../domain/entities/health_record_model.dart';

class HistoryRepo extends IHistoryRepo {
  final HistoryRemote _remote;

  HistoryRepo(this._remote);

  @override
  Query healthPointsAwardsQuery(String userId) {
    return _remote.healthPointsQuery(userId);
  }

  @override
  Query redeemsQuery(String userId) {
    return _remote.redeemsQuery(userId);
  }

  @override
  Stream<HealthRecordModel> healthPointsAwardsChanges(String userId) {
    return _remote
        .healthPointsQuery(userId)
        .snapshots()
        .skip(1)
        .expand((element) => element.docChanges)
        .where((element) => element.type == DocumentChangeType.added)
        .map((event) => HealthRecordModel.fromMap(
            event.doc.data() as Map<String, dynamic>));
  }

  @override
  Query<Object?> usersRankQuery() {
    return _remote.userRankQuery();
  }
}
