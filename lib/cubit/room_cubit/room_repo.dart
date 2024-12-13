import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class RoomRepo {
  Future<Response> getRooms({required String id}) async {
    try {
      Dio dio = await DioApi().sendRequest;
      final response = await dio.get("${ApiStrings.getRooms}$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
