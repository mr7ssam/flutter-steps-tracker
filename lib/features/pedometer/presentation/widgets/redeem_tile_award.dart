import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/redeem_model.dart';
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
      title: Text('You bought a ${model.name} and spent ${model.price} HP'),
      subtitle: Text(timeago.format(model.date)),
    );
  }
}
