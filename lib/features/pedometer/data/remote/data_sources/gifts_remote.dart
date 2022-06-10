import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_steps_tracker/common/const.dart';

import '../../../domain/params/bay_gift_params.dart';

class GiftsRemote {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final CollectionReference _userPedometerCollection =
      FirebaseFirestore.instance.collection(kUserPedometerCollectionKey);

  Query giftsQuery() {
    return fireStore.collection(kGiftsCollectionKey).orderBy('price');
  }

  Future<void> bay(GiftParams giftParams) async {
    await _healthPointHistoryCollection(giftParams.userId)
        .add(giftParams.toMap());
  }

  CollectionReference<Map<String, dynamic>> _healthPointHistoryCollection(
          String userId) =>
      _userPedometerCollection
          .doc(userId)
          .collection(kUserRedeemsHistoryCollectionKey);
}
