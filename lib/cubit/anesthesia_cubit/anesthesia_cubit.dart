import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/anesthesia_cubit/anesthesia_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'anesthesia_state.dart';

class AnesthesiaCubit extends Cubit<AnesthesiaState> {
  AnesthesiaCubit() : super(AnesthesiaInitial());

  void getAnesthesia() async {
    emit(AnesthesiaLoading());
    try {
      final response = await AnesthesiaRepo().getAnesthesiaRepo();

      if (response.statusCode == 200) {
        List<Anesthesia> anesthesiaModal =
            Anesthesia.fromJsonList(response.data);

        emit(AnesthesiaLoaded(anesthesiaModal: anesthesiaModal));
      } else {
        emit(AnesthesiaError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(AnesthesiaError(error: handleDioError(e)));
    } catch (e) {
      emit(AnesthesiaError(error: 'Something Went Wrong'));
    }
  }
}
