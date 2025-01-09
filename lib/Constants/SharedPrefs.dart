import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsControl {
  static Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  //SP update
  static Future<void> updatePrefs(String key, value) async {
    if (value.runtimeType == String) {
      (await getPrefs()).setString(key, value);
    } else if (value.runtimeType == double) {
      (await getPrefs()).setDouble(key, value);
    } else if (value.runtimeType == int) {
      (await getPrefs()).setInt(key, value);
    } else if (value.runtimeType == bool) {
      (await getPrefs()).setBool(key, value);
    } else if (value.runtimeType == List) {
      (await getPrefs()).setStringList(key, value);
    }
  }

  //SP getter
  static Future<dynamic> get(String key) async {
    return (await getPrefs()).get(key);
  }

  static Future<String> getString(String key) async {
    return (await getPrefs()).getString(key)!;
  }

  static Future<bool> getBool(String key) async {
    return (await getPrefs()).getBool(key)!;
  }

  static Future<double> getDouble(String key) async {
    return (await getPrefs()).getDouble(key)!;
  }

  static Future<int> getInt(String key) async {
    return (await getPrefs()).getInt(key)!;
  }

  static Future<List<String>> getStringList(String key) async {
    return (await getPrefs()).getStringList(key)!;
  }

  //SP removal
  static Future<void> delete(String key) async {
    (await getPrefs()).remove(key);
  }
}

class SharedPrefs {
  //Onboarding
  Future<bool> onboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding') ?? false;
  }

  setOnboarding(bool onboarding) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding', onboarding);
  }

  removeonboarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('onboarding');
  }

  //Hint
  Future<bool> hint() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hint') ?? false;
  }

  setHint(bool onboarding) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hint', onboarding);
  }

  removeHint() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('hint');
  }
}
