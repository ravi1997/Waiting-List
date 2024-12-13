import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/priority_cubit/priority_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'priority_state.dart';

class PriorityCubit extends Cubit<PriorityState> {
  PriorityCubit() : super(PriorityInitial());

  void getPriority() async {
    emit(PriorityLoading());
    try {
      final response = await PriorityRepo().getPriorityRepo();

      if (response.statusCode == 200) {
        List<Priority> priorityModal = Priority.fromJsonList(response.data);

        emit(PriorityLoaded(priorityModal: priorityModal));
      } else {
        emit(PriorityError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(PriorityError(error: handleDioError(e)));
    } catch (e) {
      emit(PriorityError(error: 'Something Went Wrong'));
    }
  }
}
