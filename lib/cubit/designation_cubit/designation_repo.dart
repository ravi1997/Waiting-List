import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class DesignationRepo {
  Future<Response> getDesignationRepo({required String id}) async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio.get("${ApiStrings.getDesignation}${id}");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}