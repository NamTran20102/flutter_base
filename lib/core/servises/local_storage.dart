import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  const LocalStorage(
    SharedPreferences sharedPreferences,
  ) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<void> setValue<T>(String key, T value) async {
    await _setValue(key, value);
  }

  Future<T?> getValue<T>(String key) async {
    final value = await _getValue<T>(key);
    return value;
  }

  Future<bool> containsKey(String key) async {
    return _sharedPreferences.containsKey(key);
  }

  Future<bool> removeValue(String key) async {
    return _sharedPreferences.remove(key);
  }

  Future<bool> removeAll() async {
    return _sharedPreferences.clear();
  }

  Future<void> _setValue<T>(String key, T value) async {
    switch (T) {
      case String:
        await _sharedPreferences.setString(key, value as String);
        break;
      case bool:
        await _sharedPreferences.setBool(key, value as bool);
        break;
      case double:
        await _sharedPreferences.setDouble(key, value as double);
        break;
      case int:
        await _sharedPreferences.setInt(key, value as int);
        break;
      default:
        throw Exception();
    }
  }

  Future<T?> _getValue<T>(String key) async {
    switch (T) {
      case String:
        return _sharedPreferences.getString(key) as T?;
      case bool:
        final value = _sharedPreferences.getBool(key);
        return value as T?;
      case double:
        return _sharedPreferences.getDouble(key) as T?;
      case int:
        return _sharedPreferences.getInt(key) as T?;
      default:
        throw Exception();
    }
  }
}
