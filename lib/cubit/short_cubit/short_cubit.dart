import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/short_cubit/short_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'short_state.dart';

class ShortCubit extends Cubit<ShortState> {
  ShortCubit() : super(ShortInitial());

  void getShort() async {
    emit(ShortLoading());
    try {
      final response = await ShortRepo().getShortRepo();

      if (response.statusCode == 200) {
        List<Short> shortModal = Short.fromJsonList(response.data);

        emit(ShortLoaded(shortModal: shortModal));
      } else {
        emit(ShortError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ShortError(error: handleDioError(e)));
    } catch (e) {
      emit(ShortError(error: '2Something Went Wrong'));
    }
  }
}
