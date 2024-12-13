import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../helper/dio_error_helper.dart';
import 'redate_repo.dart';

part 'redate_state.dart';

class RedateCubit extends Cubit<RedateState> {
  RedateCubit() : super(RedateInitial());

  void redateReq(int id, String date) async {
    emit(RedateLoading());
    try {
      final response = await RedateRepo().redateReq(id, date);

      if (response.statusCode == 200) {
        emit(RedateLoaded());
      } else {
        emit(RedateError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(RedateError(error: handleDioError(e)));
    } catch (e) {
      emit(RedateError(error: 'Something Went Wrong'));
    }
  }
}
