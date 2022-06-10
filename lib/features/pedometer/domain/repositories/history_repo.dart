import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/health_record_model.dart';

abstract class IHistoryRepo {
  Query healthPointsAwardsQuery(String userId);
  Query redeemsQuery(String userId);

  Stream<HealthRecordModel> healthPointsAwardsChanges(String userId);
}
