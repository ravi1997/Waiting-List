import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/eye_cubit/eye_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'eye_state.dart';

class EyeCubit extends Cubit<EyeState> {
  EyeCubit() : super(EyeInitial());

  void getEye() async {
    emit(EyeLoading());
    try {
      final response = await EyeRepo().getEyeRepo();

      if (response.statusCode == 200) {
        List<Eye> eyeModal = Eye.fromJsonList(response.data);

        emit(EyeLoaded(eyeModal: eyeModal));
      } else {
        emit(EyeError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(EyeError(error: handleDioError(e)));
    } catch (e) {
      emit(EyeError(error: 'Something Went Wrong'));
    }
  }
}
