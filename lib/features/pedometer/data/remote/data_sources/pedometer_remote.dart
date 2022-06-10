import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../common/const.dart';
import '../../../domain/entities/step_model.dart';
import '../../../domain/entities/user_counter_model.dart';

class PedometerRemote {
  PedometerRemote();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final CollectionReference _userPedometerCollection =
      FirebaseFirestore.instance.collection(kUserPedometerCollectionKey);

  late User user;

  Future<void> addSteps(StepModel newSteps) async {
    log(userId);
    final collection = _todayStepsCollection(userId);
    final doc = await collection.get().then((value) => value.docs.firstOrNull);
    final newStepsCount = newSteps.count;
    if (doc != null) {
      final snapSteps = StepModel.fromMap(doc.data());
      final todayCount = snapSteps.count + newStepsCount;

      // because the pedometer package sometimes notify for more than one step
      final countDef = todayCount - snapSteps.count;

      await doc.reference.update(snapSteps.copyWith(count: todayCount).toMap());
      await addAwards(
        todayCount,
        countDef,
      );
    } else {
      await collection.add(newSteps.toMap());
      await addAwards(
        newStepsCount,
        newStepsCount,
      );
    }
    await updateTotalCount(newSteps);
  }

  Future<void> updateTotalCount(StepModel stepModel) async {
    final userDoc = _userDoc(userId);
    final userDocRef = await userDoc.get();
    final total = (userDocRef.data() as Map?)?['count'] ?? 0;
    final newStepsCount = total + stepModel.count;
    final countDataModel = UserCounterModel(
      userName: stepModel.userName!,
      count: newStepsCount,
    ).toMap();
    if (total != 0) {
      await userDoc.update(
        countDataModel,
      );
    } else {
      await userDoc.set(countDataModel);
    }
  }

  Future<void> addAwards(int todayCount, int countDef) async {
    final collection = _healthPointCollection(userId);

    final gainABigOne = await _updateHealthPoints(
      kBigHealthRewardThreshold,
      todayCount,
      countDef,
      collection,
    );
    if (!gainABigOne) {
      await _updateHealthPoints(
        kHealthRewardThreshold,
        todayCount,
        countDef,
        collection,
      );
    }
  }

  Future<bool> _updateHealthPoints(
    int rewardThreshold,
    int todayCount,
    int countDef,
    CollectionReference<Map<String, dynamic>> collection,
  ) async {
    final overThreshold = todayCount % rewardThreshold;
    if ((overThreshold < countDef) && countDef != 0) {
      final isBig = rewardThreshold == kBigHealthRewardThreshold;

      final doc =
          await collection.get().then((value) => value.docs.firstOrNull);

      final pastHealth = (todayCount - countDef);
      int pointInc =
          (todayCount ~/ rewardThreshold) - (pastHealth ~/ rewardThreshold);

      pointInc *= isBig ? kBigHealthReward : kHealthReward;

      // update health count
      if (doc != null) {
        final points = doc.data()[kPointsKey];
        final newPoints = points + pointInc;

        await doc.reference.update({kPointsKey: newPoints});
      } else {
        await collection.add({kPointsKey: pointInc});
      }
      // add to history
      await _healthPointHistoryCollection(userId).add(
        {
          kPointsKey: pointInc,
          'date': DateTime.now().toIso8601String(),
          'big': isBig,
        },
      );
      return true;
    }
    return false;
  }

  Future<void> updateHealthPoints(int points) async {
    final collection = _healthPointCollection(userId);

    final doc = await collection.get().then((value) => value.docs.firstOrNull);
    await doc?.reference.update({kPointsKey: points});
  }

  Stream<int> todayCountStream(String useId) {
    final count = _todayStepsCollection(useId).snapshots();
    return count.map((event) => event.docs.firstOrNull?.data()[kCountKey] ?? 0);
  }

  Stream<int> healthPointStream(String useId) {
    final count = _healthPointCollection(useId).snapshots();
    return count.map((event) {
      final healthPoints = event.docs.firstOrNull?.data()[kPointsKey] ?? 0;
      return healthPoints;
    });
  }

  CollectionReference<Map<String, dynamic>> _todayStepsCollection(
          String userId) =>
      _userDoc(userId).collection(stringNowDateTime());

  CollectionReference<Map<String, dynamic>> _healthPointCollection(
          String userId) =>
      _userDoc(userId).collection(kUserHealthPointCollectionKey);

  CollectionReference<Map<String, dynamic>> _healthPointHistoryCollection(
          String userId) =>
      _userDoc(userId).collection(kUserHealthPointHistoryCollectionKey);

  DocumentReference<Object?> _userDoc(String userId) =>
      _userPedometerCollection.doc(userId);

  String get userId => user.uid;
}
