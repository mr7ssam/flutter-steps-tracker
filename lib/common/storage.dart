import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageService {
  bool? getBool(String key);

  String? getString(String key);

  int? getInt(String key);

  Future<void> setBool(String key, bool? value);

  Future<void> setString(String key, String? value);

  Future<void> setInt(String key, int? value);

  Future<void> remove(String key);
}

class StorageService implements IStorageService {
  final SharedPreferences _sharedPreferences;

  StorageService(this._sharedPreferences);

  @override
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> setBool(String key, bool? value) async {
    if (value == null) {
      return remove(key);
    }
    await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setInt(String key, int? value) async {
    if (value == null) {
      return remove(key);
    }
    await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String? value) async {
    if (value == null) {
      return remove(key);
    }
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }
}
