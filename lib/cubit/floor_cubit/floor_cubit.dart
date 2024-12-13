import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/floor_cubit/floor_repo.dart';

import '../../helper/dio_error_helper.dart';
import '../../modal/floor_modal.dart';

part 'floor_state.dart';

class FloorCubit extends Cubit<FloorState> {
  FloorCubit() : super(FloorInitial());

  void getFloor({required String id}) async {
    emit(FloorLoading());
    try {
      final response = await FloorRepo().getFloor(id: id);

      if (response.statusCode == 200) {
        List<FloorModal> floorModal = FloorModal.fromJsonList(response.data);

        emit(FloorLoaded(floorModal: floorModal));
      } else {
        emit(FloorError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(FloorError(error: handleDioError(e)));
    } catch (e) {
      emit(FloorError(error: 'Something Went Wrong'));
    }
  }
}
