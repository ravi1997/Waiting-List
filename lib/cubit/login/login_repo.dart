import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class LoginRepo {
  Future<Response> loginReq(
      {required String id, required String password}) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.post(ApiStrings.login,
          // data: {"username": "ravi199777@gmail.com", "password": "Singh@1997"});
          data: {"username": id, "password": password});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
