import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/user_counter_model.dart';

import '../../../../service_locator/service_locator.dart';
import '../../../pedometer/application/facade.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreAnimatedList(
      query: sl<PedometerFacade>().usersRankQuery(),
      emptyChild: const Center(child: Text('Lazy Town!🌚')),
      itemBuilder: (
        BuildContext context,
        DocumentSnapshot? snapshot,
        Animation<double> animation,
        int index,
      ) {
        final model =
            UserCounterModel.fromMap(snapshot!.data() as Map<String, dynamic>);
        return FadeTransition(
          opacity: animation,
          child: RankTile(model: model, rank: index + 1),
        );
      },
    );
  }
}

class RankTile extends StatelessWidget {
  const RankTile({
    Key? key,
    required this.model,
    required this.rank,
  }) : super(key: key);

  final UserCounterModel model;
  final int rank;

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.colorScheme;
    return ListTile(
      leading: RPadding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            radius: 20.r,
            backgroundColor: colorScheme.primary,
            child: Text(
              rank.toString(),
              style: TextStyle(color: colorScheme.onPrimary),
            )),
      ),
      title: Text(model.userName),
      subtitle: Text(
        model.count.toString(),
      ),
    );
  }
}
