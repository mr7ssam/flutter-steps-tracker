import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/common/const.dart';

class HistoryRemote {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Query healthPointsQuery(String userId) {
    return fireStore
        .collection(kUserPedometerCollectionKey)
        .doc(userId)
        .collection(kUserHealthPointHistoryCollectionKey)
        .orderBy('date', descending: true);
  }

  Query redeemsQuery(String userId) {
    return fireStore
        .collection(kUserPedometerCollectionKey)
        .doc(userId)
        .collection(kUserRedeemsHistoryCollectionKey)
        .orderBy('date', descending: true);
  }
}
