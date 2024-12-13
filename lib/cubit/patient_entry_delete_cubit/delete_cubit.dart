import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../helper/dio_error_helper.dart';
import 'delete_repo.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());

  void deleteReq(int id) async {
    emit(DeleteLoading());
    try {
      final response = await DeleteRepo().deleteReq(id);

      if (response.statusCode == 200) {
        emit(DeleteLoaded());
      } else {
        emit(DeleteError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DeleteError(error: handleDioError(e)));
    } catch (e) {
      emit(DeleteError(error: 'Something Went Wrong'));
    }
  }
}
