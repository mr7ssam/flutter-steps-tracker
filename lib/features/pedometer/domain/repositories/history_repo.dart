import 'package:flutter_steps_tracker/features/pedometer/domain/entities/redeem_model.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/user_counter_model.dart';

import '../entities/health_record_model.dart';

abstract class IHistoryRepo {
  Stream<List<HealthRecordModel>> healthPointsAwardsHistory(String userId);

  Stream<List<RedeemModel>> redeemsHistory(String userId);

  Stream<List<UserCounterModel>> usersRankStream();

  Stream<HealthRecordModel> healthPointsAwardsChanges(String userId);
}
