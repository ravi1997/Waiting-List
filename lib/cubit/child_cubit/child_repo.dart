import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class ChildRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getChild() async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.get(ApiStrings.getChild);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> verifyChild(int user) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.post('${ApiStrings.verifyChild}$user');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
