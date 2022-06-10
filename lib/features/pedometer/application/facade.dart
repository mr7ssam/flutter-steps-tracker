import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/params/bay_gift_params.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/repositories/history_repo.dart';
import 'package:pedometer/pedometer.dart';

import '../../user/domain/repositories/repo.dart';
import '../domain/entities/health_record_model.dart';
import '../domain/repositories/gifts_repo.dart';
import '../domain/repositories/pedometer_repo.dart';

class PedometerFacade {
  PedometerFacade(
    this.repo,
    this.userRepo,
    this.historyRepo,
    this.giftsRepo,
  );

  final IPedometerRepo repo;
  final IUserRepo userRepo;
  final IHistoryRepo historyRepo;
  final IGiftsRepo giftsRepo;

  Future<void> startPedometerListener() async {
    await repo.initLocalCount();
    repo.startPedometerListener(userRepo.user!);
  }

  void stopListener() => repo.stopListener();

  Query healthPointsAwardsQuery() =>
      historyRepo.healthPointsAwardsQuery(_userUid());

  Query redeemsQuery() => historyRepo.redeemsQuery(_userUid());

  Query giftsQuery() => giftsRepo.giftsQuery();

  Query usersRankQuery() => historyRepo.usersRankQuery();

  Future<void> bayGift(GiftParams giftParams) async {
    final params = giftParams.copyWith(
      userId: _userUid(),
      healthPoints: healthPointsValue,
    );
    await repo.updateHealthPoints(params.newPoints);

    return giftsRepo.bayGift(
      params,
    );
  }

  Stream<HealthRecordModel> healthPointsAwardsChanges() =>
      historyRepo.healthPointsAwardsChanges(_userUid());

  Stream<int> get stepCount => repo.stepCount;

  Stream<int> get healthPoints => repo.healthPoints;

  int get healthPointsValue => repo.healthPointsValue;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      repo.pedestrianStatusStream;

  String _userUid() => userRepo.user!.uid;
}
