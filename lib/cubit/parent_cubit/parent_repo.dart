import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class ParentRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> setParent(int user) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.post('${ApiStrings.userParent}$user');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
