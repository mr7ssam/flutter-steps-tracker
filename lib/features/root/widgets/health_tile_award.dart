import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../common/provider/local_provider.dart';
import '../../pedometer/domain/entities/health_record_model.dart';

class HealthTileAward extends StatelessWidget {
  const HealthTileAward({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HealthRecordModel model;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final s = S.of(context);
    return ListTile(
      leading: Icon(Icons.assistant_photo_outlined, color: colorScheme.primary),
      title: Text(s.award_title(model.points)),
      subtitle: Text(
        timeago.format(
          model.date,
          locale: LocalizationProvider.of(context).local.languageCode,
        ),
      ),
      trailing: model.big
          ? Card(
              child: RPadding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  s.big_one,
                  style: TextStyle(color: colorScheme.secondary),
                ),
              ),
            )
          : null,
    );
  }
}
