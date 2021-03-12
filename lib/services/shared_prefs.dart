import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<bool> isFirstTimeRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('firstRun')) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> setFirstTimeRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstRun', false);
  }
}
