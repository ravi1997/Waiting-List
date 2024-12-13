import 'package:dio/dio.dart';
import 'package:rpc_waiting_list/modal/patient_demographic.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class AdviceRepo {
  Future<Response> adviceReq(
      {required Advice advice,
      required PatientDemographic patientDemographic}) async {
    try {
      Dio dio = await DioApi(isHeader: true).sendRequest;
      final response = await dio.post(ApiStrings.patientCreate, data: {
        "patient_entry": advice.toJson(),
        "demographic": patientDemographic.toJson()
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
