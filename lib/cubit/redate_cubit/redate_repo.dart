import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class RedateRepo {
  Future<Response> redateReq(id, String date) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response =
          await dio.put('${ApiStrings.patientReDate}$id', data: {"date": date});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
