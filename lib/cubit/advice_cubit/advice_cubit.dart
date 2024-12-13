import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rpc_waiting_list/cubit/advice_cubit/advice_repo.dart';
import 'package:rpc_waiting_list/helper/token.dart';
import 'package:rpc_waiting_list/modal/patient_demographic.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceInitial());

  LocalToken localToken = LocalToken();

  void adviceReq(
      {required Advice advice,
      required PatientDemographic patientDemographic}) async {
    emit(AdviceLoading());
    try {
      final response = await AdviceRepo()
          .adviceReq(advice: advice, patientDemographic: patientDemographic);

      if (response.statusCode == 200) {
        emit(AdviceLoaded());
      } else {
        emit(AdviceError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(AdviceError(error: handleDioError(e)));
    } catch (e) {
      emit(AdviceError(error: 'Something Went Wrong'));
    }
  }
}
