import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class DiagnosisRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getDiagnosisRepo() async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.get(ApiStrings.diagnosis);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
