import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

import 'tabs/tabs.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: colorScheme.primary,
            indicatorColor: colorScheme.primary,
            tabs: const [
              Tab(
                text: 'Health Points',
              ),
              Tab(
                text: 'Redeems',
              )
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                KeepAliveWidget(child: HealthPointHistoryTab()),
                KeepAliveWidget(child: RedeemsHistoryTab()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
