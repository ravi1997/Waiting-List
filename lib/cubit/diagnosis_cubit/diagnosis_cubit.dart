import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/diagnosis_cubit/diagnosis_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'diagnosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  DiagnosisCubit() : super(DiagnosisInitial());

  void getDiagnosis() async {
    emit(DiagnosisLoading());
    try {
      final response = await DiagnosisRepo().getDiagnosisRepo();

      if (response.statusCode == 200) {
        List<Diagnosis> diagnosisModal = Diagnosis.fromJsonList(response.data);

        emit(DiagnosisLoaded(diagnosisModal: diagnosisModal));
      } else {
        emit(DiagnosisError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DiagnosisError(error: handleDioError(e)));
    } catch (e) {
      emit(DiagnosisError(error: 'Something Went Wrong'));
    }
  }
}
