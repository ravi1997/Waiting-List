import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class CadreRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getCadreRepo() async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio.get(ApiStrings.cadre);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
