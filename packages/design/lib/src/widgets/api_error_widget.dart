import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';

class APIErrorWidget extends StatelessWidget {
  const APIErrorWidget({
    Key? key,
    required this.exception,
  }) : super(key: key);

  final AppException exception;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          exception.noInternetConnection
              ? const Icon(Icons.signal_wifi_connected_no_internet_4)
              : const Icon(Icons.error_outline),
          YouText.bodySmall(exception.message)
        ],
      ),
    );
  }
}
