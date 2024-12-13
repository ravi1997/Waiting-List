import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class FloorRepo {
  Future<Response> getFloor({required String id}) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.get("${ApiStrings.getFloors}$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
