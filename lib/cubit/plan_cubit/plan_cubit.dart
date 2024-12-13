import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/plan_cubit/plan_repo.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanInitial());

  void getPlan() async {
    emit(PlanLoading());
    try {
      final response = await PlanRepo().getPlanRepo();

      if (response.statusCode == 200) {
        List<Plan> planModal = Plan.fromJsonList(response.data);

        emit(PlanLoaded(planModal: planModal));
      } else {
        emit(PlanError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(PlanError(error: handleDioError(e)));
    } catch (e) {
      emit(PlanError(error: 'Something Went Wrong'));
    }
  }
}
