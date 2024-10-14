import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class LogoutRepo {
  Future<Response> logoutReq() async {
    try {
      Dio dio = DioApi(isHeader: true).sendRequest;
      final response = await dio.get(ApiStrings.logOut);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
