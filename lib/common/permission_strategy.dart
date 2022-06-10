import 'package:permission_handler/permission_handler.dart';

abstract class GrantPermissionStrategy {
  final Permission permission;

  GrantPermissionStrategy(this.permission);

  Future<void> request({
    required final OnPermanentlyDenied onPermanentlyDenied,
    required final OnGranted onGranted,
    required final OnDenied onDenied,
  }) async {
    PermissionStatus status = await permission.status;

    if (!status.isLimited && !status.isGranted) {
      final PermissionStatus result = await permission.request();

      if (result.isGranted) {
        onGranted.call();
        return;
      } else if (result.isDenied) {
        onDenied.call();
        return;
      } else if (result.isPermanentlyDenied) {
        onPermanentlyDenied.call();
        await openAppSettings();
        return;
      } else if (!result.isGranted) {
        onDenied.call();
        return;
      }
    } else {
      onGranted.call();
    }
  }
}

typedef OnPermanentlyDenied = void Function();

typedef OnDenied = void Function();

typedef OnGranted = void Function();

class GrantPermissionActivityStrategy extends GrantPermissionStrategy {
  GrantPermissionActivityStrategy() : super(Permission.activityRecognition);
}
