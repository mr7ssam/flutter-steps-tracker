import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/user_counter_model.dart';
import 'package:flutter_steps_tracker/features/root/pages/rank_page/provider.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../widgets/rank_tile.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<RankProvider, List<UserCounterModel>>(
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(child: Text(S.of(context).empty_rank));
          }
          return ListView.builder(
            itemCount: value.length,
            padding: PEdgeInsets.vertical,
            itemBuilder: (context, index) {
              final model = value[index];
              return RankTile(
                model: model,
                rank: index + 1,
              );
            },
          );
        },
        selector: (_, data) => data.usersRank);
  }
}
