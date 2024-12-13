import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class DeleteRepo {
  Future<Response> deleteReq(id) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.delete('${ApiStrings.patientDelete}$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
