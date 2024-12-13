import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class PatientRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getPatientRepo(String uhid) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.get('${ApiStrings.fetch}$uhid');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
