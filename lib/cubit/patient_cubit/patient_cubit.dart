import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/patient_cubit/patient_repo.dart';
import 'package:rpc_waiting_list/modal/patient_demographic.dart';

import '../../helper/dio_error_helper.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  void fetchPatientByUHID(String uhid) async {
    emit(PatientLoading());
    try {
      final response = await PatientRepo().getPatientRepo(uhid);

      if (response.statusCode == 200) {
        PatientDemographic patientModal =
            PatientDemographic.fromJson(response.data);

        emit(PatientLoaded(patientModal: patientModal));
      } else {
        emit(PatientError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(PatientError(error: handleDioError(e)));
    } catch (e) {
      emit(PatientError(error: 'Something Went Wrong'));
    }
  }
}
