import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';
import 'get_repo.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());

  void getReq(int id) async {
    emit(GetLoading());
    try {
      final response = await GetRepo().getReq(id);

      if (response.statusCode == 200) {
        Advice adviceModal = Advice.fromJson(response.data['patient']);
        emit(GetLoaded(adviceModal: adviceModal));
      } else {
        emit(GetError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(GetError(error: handleDioError(e)));
    } catch (e) {
      emit(GetError(error: 'Something Went Wrong'));
    }
  }
}
