class SharedPrefKey {
  SharedPrefKey.internal();
  factory SharedPrefKey() => _instance;
  static SharedPrefKey _instance = SharedPrefKey.internal();

  static String cookie = "fantasy_cookie";
  static String gr_cookie = "gr_cookie";
  static String analyticsCookie = "analytics_cookie";
  static String websocketKey = "ws_fantasy_cookie";
  static String isRegisteredUser = "registered_user";
  static String offlineUser = "offline_user";
}
