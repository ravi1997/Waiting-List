import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class RegistrationAccountRepo {
  Future<Response> registrationReq({
    required String username,
    required String password,
    required String userId,
  }) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.post(ApiStrings.createAccount, data: {
        "username": username,
        "password": password,
        "user_id": userId
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
