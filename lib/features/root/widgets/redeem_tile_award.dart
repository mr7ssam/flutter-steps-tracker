import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/common/provider/local_provider.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

import '../../pedometer/domain/entities/redeem_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class RedeemTileAward extends StatelessWidget {
  const RedeemTileAward({
    Key? key,
    required this.model,
  }) : super(key: key);

  final RedeemModel model;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return ListTile(
      leading: Icon(Icons.shopping_basket_outlined, color: colorScheme.primary),
      title: Text(S.of(context).redeems_title(model.price, model.name)),
      subtitle: Text(timeago.format(model.date,
          locale: LocalizationProvider.of(context).local.languageCode)),
    );
  }
}
