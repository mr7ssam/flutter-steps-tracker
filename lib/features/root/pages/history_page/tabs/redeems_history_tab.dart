import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/root/pages/history_page/provider.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import '../../../../pedometer/domain/entities/redeem_model.dart';
import '../../../widgets/redeem_tile_award.dart';

class RedeemsHistoryTab extends StatelessWidget {
  const RedeemsHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HistoryProvider, List<RedeemModel>>(
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(child: Text(S.of(context).empty_redeems_history));
          }
          return ListView.builder(
            padding: PEdgeInsets.vertical,
            itemCount: value.length,
            itemBuilder: (context, index) {
              final model = value[index];
              return RedeemTileAward(model: model);
            },
          );
        },
        selector: (_, data) => data.redeemsRecords);
  }
}
