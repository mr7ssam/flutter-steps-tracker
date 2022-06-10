import 'dart:developer';

import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/common/provider/user_provider.dart';
import 'package:flutter_steps_tracker/features/pedometer/presentation/manager/pedometer_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:odometer/odometer.dart';
import 'package:provider/provider.dart';

import '../../../../../common/const.dart';
import '../../../../../resources/resources.dart';

class PedometerPage extends StatelessWidget {
  const PedometerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.colorScheme;
    final loading =
        context.select<PedometerProvider, bool>((value) => value.loading);
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Consumer<PedometerProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Padding(
              padding: PEdgeInsets.horizontal,
              child: Consumer<UserProvider>(
                builder: (context, value, child) {
                  final name = value.user.displayName;
                  return name != null
                      ? YouText.titleLarge(name)
                      : const SizedBox();
                },
              ),
            ),
            Padding(
              padding: PEdgeInsets.listView,
              child: YouText.titleLarge(yMMMdFormatter(DateTime.now())),
            ),
            const Spacer(flex: 1),
            Builder(
              builder: (context) {
                final walking = context
                    .select<PedometerProvider, bool?>((value) => value.walking);
                log(walking.toString());
                return Lottie.asset(
                  LottieAssets.walking,
                  repeat: walking,
                );
              },
            ),
            const YouText.titleLarge('Your Steps Today'),
            Space.vM1,
            Builder(builder: (context) {
              final count = context
                  .select<PedometerProvider, int>((value) => value.count);
              return AnimatedSlideOdometerNumber(
                letterWidth: 32.r,
                numberTextStyle: textTheme.displaySmall
                    ?.copyWith(color: colorScheme.secondary),
                odometerNumber: OdometerNumber(count),
                duration: const Duration(seconds: 1),
              );
            }),
            const Spacer(flex: 2),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.info_outline, size: 36.r),
                              Space.vM1,
                              const YouText.bodyMedium(
                                'Get $kBigHealthReward HP for $kBigHealthRewardThreshold steps, and $kHealthReward HP for $kHealthRewardThreshold steps ',
                              ),
                            ],
                          ),
                        ));
              },
              icon: const Icon(Icons.info_outline),
            ),
            const YouText.titleLarge('Health Points',
                style: TextStyle(color: Colors.green)),
            Space.vS1,
            Builder(
              builder: (context) {
                final count = context.select<PedometerProvider, int>(
                    (value) => value.healthPoints);
                return AnimatedSlideOdometerNumber(
                  letterWidth: 16.r,
                  numberTextStyle: textTheme.headline6,
                  odometerNumber: OdometerNumber(count),
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        );
      },
    );
  }
}
