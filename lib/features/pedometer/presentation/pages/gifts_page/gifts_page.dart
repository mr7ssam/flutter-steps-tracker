import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/design.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/gift_model.dart';
import 'package:odometer/odometer.dart';

import '../../../../../service_locator/service_locator.dart';
import '../../../application/facade.dart';
import '../../manager/pedometer_provider.dart';
import '../../widgets/gift_card.dart';

class GiftsPage extends StatelessWidget {
  const GiftsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: PEdgeInsets.listView,
          child: Row(
            children: [
              const YouText.titleMedium(
                'Your Health Points: ',
              ),
              Space.hS1,
              Builder(
                builder: (context) {
                  final count = context.select<PedometerProvider, int>(
                      (value) => value.healthPoints);
                  return AnimatedSlideOdometerNumber(
                    letterWidth: 10.r,
                    numberTextStyle:
                        textTheme.titleMedium?.copyWith(color: Colors.green),
                    odometerNumber: OdometerNumber(count),
                    duration: const Duration(seconds: 1),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: FirestoreAnimatedGrid(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 16,
            padding: PEdgeInsets.horizontal,
            query: sl<PedometerFacade>().giftsQuery(),
            itemBuilder: (
              BuildContext context,
              DocumentSnapshot? snapshot,
              Animation<double> animation,
              int index,
            ) {
              final model =
                  GiftModel.fromMap(snapshot!.data() as Map<String, dynamic>);
              return FadeTransition(
                opacity: animation,
                child: GiftCard(model: model),
              );
            },
          ),
        ),
      ],
    );
  }
}
