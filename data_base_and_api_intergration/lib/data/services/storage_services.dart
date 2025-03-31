import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class StorageService {
  static const String _userKey = 'saved_user';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<User?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    
    if (userJson != null) {
      final Map<String, dynamic> userData = json.decode(userJson);
      return User.fromJson(userData);
    }
    
    return null;
  }
}

