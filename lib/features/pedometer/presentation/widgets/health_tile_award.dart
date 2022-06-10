import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/entities/health_record_model.dart';

class HealthTileAward extends StatelessWidget {
  const HealthTileAward({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HealthRecordModel model;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return ListTile(
      leading: Icon(Icons.assistant_photo_outlined, color: colorScheme.primary),
      title: Text('You awarded a ${model.points} HP'),
      subtitle: Text(timeago.format(model.date)),
      trailing: model.big
          ? Card(
              child: RPadding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Big one',
                  style: TextStyle(color: colorScheme.secondary),
                ),
              ),
            )
          : null,
    );
  }
}
