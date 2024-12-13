import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/doctor_cubit/doctor_repo.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  void getDoctor() async {
    emit(DoctorLoading());
    try {
      final response = await DoctorRepo().getDoctorRepo();

      if (response.statusCode == 200) {
        List<User> doctorModal = User.fromJsonList(response.data);

        emit(DoctorLoaded(doctorModal: doctorModal));
      } else {
        emit(DoctorError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DoctorError(error: handleDioError(e)));
    } catch (e) {
      emit(DoctorError(error: 'Something Went Wrong'));
    }
  }
}
