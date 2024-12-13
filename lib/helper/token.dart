import 'package:shared_preferences/shared_preferences.dart';

class LocalToken {
  String accessToken = 'access_token';

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessToken) ?? '';
  }

  Future<void> writeAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(accessToken, token);
  }

  Future<void> clearAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessToken);
  }

//   final accessToken = getAccessToken();
// // Use accessToken in API requests or other operations
}
