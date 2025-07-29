import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  // Box name for user info
  static const String _userInfoBox = 'userInfoBox';

  // Open the box
  static Future<Box> _openBox() async {
    return await Hive.openBox(_userInfoBox);
  }

  // Save user info as a Map<String, dynamic>
  static Future<void> setUserInfo(Map<String, dynamic> userInfo) async {
    final box = await _openBox();
    await box.put('userInfo', userInfo); // Save the user info map
  }

  // Retrieve user info
  static Future<Map<dynamic, dynamic>?> getUserInfo() async {
    final box = await _openBox();
    final userInfo = box.get('userInfo');

    // print("userInfo : $userInfo ");
    if (userInfo != null) {
      return userInfo;
    }
    return null;
  }

  // Save data with a dynamic key
  static Future<void> saveData(String key, dynamic value) async {
    final box = await _openBox();
    await box.put(key, value);
  }

  // Retrieve data with a dynamic key
  static Future<dynamic> getData(String key) async {
    final box = await _openBox();
    return box.get(key);
  }

  // Delete user info
  static Future<void> deleteUserInfo() async {
    final box = await _openBox();
    await box.delete('userInfo'); // Delete the user info map
  }

  // Clear the box
  static Future<void> clearAll() async {
    final box = await _openBox();
    await box.clear();
  }
}
