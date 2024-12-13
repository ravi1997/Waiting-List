import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class GetRepo {
  Future<Response> getReq(id) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.get('${ApiStrings.patientGet}$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
