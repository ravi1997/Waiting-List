import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class RegistrationUserRepo {
  Future<Response> registrationReq({
    required int designationId,
    required String email,
    required String employeeId,
    required String firstName,
    required String middleName,
    required String lastName,
    required String mobile,
    required int cadreId,
    required int departmentId,
    required int officeAddressId,
    required int unitId,
  }) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.post(ApiStrings.createUser, data: {
        "designation_id": designationId,
        "email": email,
        "employee_id": employeeId,
        "firstname": firstName,
        "lastname": lastName,
        "middlename": middleName,
        "mobile": mobile,
        "cadre_id": cadreId,
        "department_id": departmentId,
        "officeAddress_id": officeAddressId,
        "unit_id": unitId,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
