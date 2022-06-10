import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/root/manager/permission_handler_provider.dart';
import 'package:provider/provider.dart';

class PermissionHandlerWidget extends StatelessWidget {
  final WidgetBuilder builder;

  const PermissionHandlerWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionHandlerProvider>(
      builder: (context, value, child) {
        var permissionState = value.state;
        if (permissionState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (permissionState.isPermanentlyDenied ||
            permissionState.isDenied) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Permission is is denied!'),
              Space.vM2,
              FilledButton(
                child: const Text('Give permission'),
                onPressed: () {
                  context.read<PermissionHandlerProvider>().askFormPermission();
                },
              ),
            ],
          );
        } else {
          return builder(context);
        }
      },
    );
  }
}
