import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rpc_waiting_list/helper/token.dart';

class DioApi {
  DioApi({
    this.isHeader = false,
    // this.token,
  });

  LocalToken localToken = LocalToken();

  final bool isHeader;

  // final String? token;

  static Map<String, dynamic>? header = {};

  final Dio _dio = Dio(BaseOptions(
      contentType: 'application/json',
      validateStatus: ((status) => true),
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120));

  Future<Dio> get sendRequest async {
    if (isHeader) {
      String token = '';

      token = await localToken.getAccessToken();

      header = {
        // 'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      header = null;
    }
    _dio.options.headers = header;
    return _dio;
  }
}
