import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class UnitRepo {
  Future<Response> getUnitRepo({required String id}) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.get("${ApiStrings.unit}$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
