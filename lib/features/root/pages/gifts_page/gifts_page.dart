import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/gift_model.dart';
import 'package:flutter_steps_tracker/features/root/pages/gifts_page/provider.dart';
import 'package:odometer/odometer.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../../manager/pedometer_provider.dart';
import '../../widgets/gift_card.dart';

class GiftsPage extends StatelessWidget {
  const GiftsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Padding(
          padding: PEdgeInsets.listView,
          child: Row(
            children: [
              YouText.titleMedium(
                s.health_points,
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
          child: Selector<GiftsProvider, List<GiftModel>>(
              builder: (context, value, child) {
                if (value.isEmpty) {
                  return Center(
                    child: Text(
                      s.empty_gifts,
                    ),
                  );
                }
                return GridView.builder(
                  padding: PEdgeInsets.listView,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 16.r,
                    mainAxisSpacing: 16.r,
                  ),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final model = value[index];
                    return GiftCard(model: model);
                  },
                );
              },
              selector: (_, data) => data.gifts),
        )
      ],
    );
  }
}
