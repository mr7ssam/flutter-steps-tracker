import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/permission_strategy.dart';

class PermissionHandlerProvider extends ChangeNotifier {
  PermissionHandlerProvider() : _state = PermissionState.loading;

  PermissionState _state;

  PermissionState get state => _state;

  set state(PermissionState status) {
    _state = status;
    notifyListeners();
  }

  askFormPermission() async {
    final strategy = GrantPermissionActivityStrategy();
    strategy.request(
      onPermanentlyDenied: () async {
        state = PermissionState.permanentlyDenied;
        await openAppSettings();
      },
      onGranted: () {
        state = PermissionState.granted;
      },
      onDenied: () {
        state = PermissionState.denied;
      },
    );
  }
}

extension PermissionStateEx on PermissionState {
  bool get isLoading => this == PermissionState.loading;

  bool get isGranted => this == PermissionState.granted;

  bool get isDenied => this == PermissionState.denied;

  bool get isPermanentlyDenied => this == PermissionState.permanentlyDenied;
}

enum PermissionState {
  loading,
  granted,
  denied,
  permanentlyDenied,
}
