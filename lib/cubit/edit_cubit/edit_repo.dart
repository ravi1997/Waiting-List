import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class EditRepo {
  Future<Response> editReq(Advice advice) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response =
          await dio.put(ApiStrings.patientUpdate, data: advice.toJsonwithID());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
