import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/eua_cubit/eua_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'eua_state.dart';

class EUACubit extends Cubit<EUAState> {
  EUACubit() : super(EUAInitial());

  void getEUA() async {
    emit(EUALoading());
    try {
      final response = await EUARepo().getEUARepo();

      if (response.statusCode == 200) {
        List<EUA> euaModal = EUA.fromJsonList(response.data);

        emit(EUALoaded(euaModal: euaModal));
      } else {
        emit(EUAError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(EUAError(error: handleDioError(e)));
    } catch (e) {
      emit(EUAError(error: '2Something Went Wrong'));
    }
  }
}
