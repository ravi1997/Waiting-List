import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/room_cubit/room_repo.dart';

import '../../helper/dio_error_helper.dart';
import '../../modal/room_modal.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomInitial());

  void getRooms({required String id}) async {
    emit(RoomLoading());
    try {
      final response = await RoomRepo().getRooms(id: id);

      if (response.statusCode == 200) {
        List<RoomModal> roomModal = RoomModal.fromJsonList(response.data);

        emit(RoomLoaded(roomModal: roomModal));
      } else {
        emit(RoomError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(RoomError(error: handleDioError(e)));
    } catch (e) {
      emit(RoomError(error: 'Something Went Wrong'));
    }
  }
}
