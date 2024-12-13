import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/unit_cubit/unit_repo.dart';
import 'package:rpc_waiting_list/modal/unit_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(UnitInitial());

  void getUnitRepo({required String id}) async {
    emit(UnitLoading());
    try {
      final response = await UnitRepo().getUnitRepo(id: id);

      if (response.statusCode == 200) {
        List<UnitModal> unitModals = UnitModal.fromJsonList(response.data);

        emit(UnitLoaded(unitModal: unitModals));
      } else {
        emit(UnitError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(UnitError(error: handleDioError(e)));
    } catch (e) {
      emit(UnitError(error: 'Something Went Wrong'));
    }
  }
}
