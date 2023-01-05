import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  const LocalService(this.localStorage);

  final SharedPreferences localStorage;

  Future<String?> fetch(String key) async {
    final response = localStorage.getString(key);
    return response;
  }

  Future<void> store(String key, String data) async {
    localStorage.setString(key, data);

    debugPrint('data saved');
  }

  Future<void> delete(String key) async {
    localStorage.remove(key);

    debugPrint('data deleted');
  }
}
