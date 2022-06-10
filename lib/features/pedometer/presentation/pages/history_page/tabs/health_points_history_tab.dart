import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';

import '../../../../../../service_locator/service_locator.dart';
import '../../../../application/facade.dart';
import '../../../../domain/entities/health_record_model.dart';
import '../../../widgets/health_tile_award.dart';

class HealthPointHistoryTab extends StatelessWidget {
  const HealthPointHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreAnimatedList(
      query: sl<PedometerFacade>().healthPointsAwardsQuery(),
      emptyChild: const Center(child: Text('Move move! 🏃')),
      itemBuilder: (
        BuildContext context,
        DocumentSnapshot? snapshot,
        Animation<double> animation,
        int index,
      ) {
        final model =
            HealthRecordModel.fromMap(snapshot!.data() as Map<String, dynamic>);
        return FadeTransition(
          opacity: animation,
          child: HealthTileAward(model: model),
        );
      },
    );
  }
}
