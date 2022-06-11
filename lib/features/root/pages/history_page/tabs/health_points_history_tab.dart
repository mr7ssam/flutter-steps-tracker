import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import '../../../../pedometer/domain/entities/health_record_model.dart';
import '../../../widgets/health_tile_award.dart';
import '../provider.dart';

class HealthPointHistoryTab extends StatelessWidget {
  const HealthPointHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HistoryProvider, List<HealthRecordModel>>(
      builder: (context, value, child) {
        if (value.isEmpty) {
          return Center(
            child: Text(S.of(context).empty_health_points_history),
          );
        }

        return ListView.builder(
          padding: PEdgeInsets.vertical,
          itemCount: value.length,
          itemBuilder: (context, index) {
            final model = value[index];
            return HealthTileAward(model: model);
          },
        );
      },
      selector: (_, data) => data.healthRecords,
    );
  }
}
