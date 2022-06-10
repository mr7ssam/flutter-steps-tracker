import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';

import '../../../../../../service_locator/service_locator.dart';
import '../../../../pedometer/application/facade.dart';
import '../../../../pedometer/domain/entities/redeem_model.dart';
import '../../../../pedometer/presentation/widgets/redeem_tile_award.dart';

class RedeemsHistoryTab extends StatelessWidget {
  const RedeemsHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreAnimatedList(
      query: sl<PedometerFacade>().redeemsQuery(),
      emptyChild: const Center(child: Text('No redeems 😢')),
      itemBuilder: (
        BuildContext context,
        DocumentSnapshot? snapshot,
        Animation<double> animation,
        int index,
      ) {
        final model =
            RedeemModel.fromMap(snapshot!.data() as Map<String, dynamic>);
        return FadeTransition(
          opacity: animation,
          child: RedeemTileAward(model: model),
        );
      },
    );
  }
}
