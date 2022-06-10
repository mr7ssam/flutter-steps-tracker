import 'package:design/design.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RPadding(
          padding: EdgeInsets.all(8), child: CircularProgressIndicator()),
    );
  }
}
