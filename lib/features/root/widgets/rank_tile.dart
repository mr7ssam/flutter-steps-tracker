import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';

import '../../pedometer/domain/entities/user_counter_model.dart';

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
