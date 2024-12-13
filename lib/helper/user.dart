import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../modal/registration_user_modal.dart';

class LocalUser {

  String user = 'user';

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string
    String? userJson = prefs.getString(user);

    // If the JSON string exists, decode it into a User object
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    }

    // Return null if no user data exists
    return null;
  }

  Future<void> writeUser(User userObj) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the user object to a JSON string
    String userJson = jsonEncode(userObj.toJson());

    // Save the JSON string in SharedPreferences
    await prefs.setString(user, userJson);
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(user);
  }

//   final accessUser = getUser();
// // Use accessUser in API requests or other operations
}
