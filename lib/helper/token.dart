import 'package:get_storage/get_storage.dart';

class LocalToken {
  static GetStorage storage = GetStorage();

  String accessToken = 'access_token';

  String getAccessToken() {
    return storage.read(accessToken) ?? '';
  }

  Future<void> writeAccessToken(String token) {
    return storage.write(accessToken, token);
  }

  void clearAccessToken() {
    storage.remove(accessToken);
  }

//   final accessToken = getAccessToken();
// // Use accessToken in API requests or other operations
}
