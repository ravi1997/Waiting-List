import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/helper/api_strings.dart';

import '../../helper/dio_helper.dart';

class SlotRepo {
  // final ApiStrings route = ApiStrings();

  Future<Response> getSlotRepo() async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.get(ApiStrings.patientGetAll);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
