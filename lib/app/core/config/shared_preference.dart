import '../../../utils/exports.dart';

abstract class PrefsKey {
  static const isLoggedIn = "keyIsLoggedIn";
  static const currentLocale = "keyCurrentLocale";
}

abstract class SharedPref {
  static GetStorage? _prefsInstance;

  static init() {
    _prefsInstance ??= GetStorage();
  }

  static void _isPreferenceReady() {
    assert(_prefsInstance != null, "SharedPreferences not ready yet!");
  }

  static bool getBool(String key, [bool? defValue]) {
    _isPreferenceReady();
    return _prefsInstance?.read(key) ?? defValue ?? false;
  }

  static int getInt(String key, [int? defValue]) {
    _isPreferenceReady();
    return _prefsInstance?.read(key) ?? defValue ?? 0;
  }

  static double getDouble(String key, [double? defValue]) {
    _isPreferenceReady();
    return _prefsInstance?.read(key) ?? defValue ?? 0.0;
  }

  static String getString(String key, [String? defValue]) {
    _isPreferenceReady();
    return _prefsInstance?.read(key) ?? defValue ?? "";
  }

  static List<String> getStringList(String key, [List<String>? defValue]) {
    _isPreferenceReady();
    return _prefsInstance?.read(key) ?? defValue ?? [""];
  }

  static Future<void> setValue(String key, dynamic value) async {
    _prefsInstance?.write(key, value);
  }

  // Removes an entry from persistent storage.
  static Future<void> remove(String key) async {
    _prefsInstance?.remove(key);
  }

  // Returns all keys in the persistent storage.
  static Set<String>? getKeys() {
    _isPreferenceReady();
    return _prefsInstance?.getKeys();
  }

  // Completes with true once the user preferences for the app has been cleared.
  static Future<void> clearData() async {
    _prefsInstance?.erase();
  }

  // Best to clean up by calling this function in the State object's dispose() function.
  static void dispose() {
    _prefsInstance = null;
  }
}
