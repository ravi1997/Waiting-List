import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class DepartmentRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getDepartmentRepo() async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.get(ApiStrings.department);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
