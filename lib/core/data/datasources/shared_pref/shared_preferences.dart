import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wd_client/core/data/datasources/shared_pref/shared_pref_key.dart';

class SharedPrefHelper {
  factory SharedPrefHelper() => _instance;

  SharedPrefHelper.internal();

  static final SharedPrefHelper _instance = SharedPrefHelper.internal();

  static String? wsCookie;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> saveCookieToStorage(String cookie) async {
    return saveToSharedPref(SharedPrefKey.cookie, cookie);
  }

  Future<void> saveWSCookieToStorage(String cookie) async {
    wsCookie = cookie;
    final SharedPreferences pref = await _prefs;
    pref.setString(SharedPrefKey.websocketKey, cookie);
  }

  Future<String?> getCookie() async {
    dynamic cookie = await getFromSharedPref(SharedPrefKey.cookie);

    if (cookie == null || (cookie as String).isEmpty) {
      final dynamic grCookie = await getFromSharedPref(SharedPrefKey.gr_cookie);
      if (!(grCookie == null || (grCookie as String).isEmpty)) {
        cookie = grCookie;
        saveCookieToStorage(cookie);
      }
    }

    return cookie as String?;
  }

  Future<bool> removeCookie() async {
    return removeFromSharedPref(SharedPrefKey.cookie);
  }

  Future<bool> saveToSharedPref(String key, String value) async {
    final SharedPreferences pref = await _prefs;
    return pref.setString(key, value);
  }

  Future<dynamic> getFromSharedPref(String key) async {
    final SharedPreferences pref = await _prefs;
    return pref.get(key);
  }

  Future<bool> removeFromSharedPref(String key) async {
    final SharedPreferences pref = await _prefs;
    return pref.remove(key);
  }
}
