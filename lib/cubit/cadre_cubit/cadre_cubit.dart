import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/modal/cadre_modal.dart';

import '../../helper/dio_error_helper.dart';
import 'cadre_repo.dart';

part 'cadre_state.dart';

class CadreCubit extends Cubit<CadreState> {
  CadreCubit() : super(CadreInitial());

  void getCadre() async {
    emit(CadreLoading());
    try {
      final response = await CadreRepo().getCadreRepo();

      if (response.statusCode == 200) {
        List<CadreModal> cadreModal = CadreModal.fromJsonList(response.data);

        emit(CadreLoaded(cadreModal: cadreModal));
      } else {
        emit(CadreError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(CadreError(error: handleDioError(e)));
    } catch (e) {
      emit(CadreError(error: 'Something Went Wrong'));
    }
  }
}
