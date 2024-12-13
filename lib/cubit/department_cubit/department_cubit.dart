import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/department_cubit/department_repo.dart';
import 'package:rpc_waiting_list/modal/department_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());

  void getDepartment() async {
    // emit(CadreLoading());
    try {


      final response = await DepartmentRepo().getDepartmentRepo();

      if (response.statusCode == 200) {
        List<DepartmentModal> departmentModals =
            DepartmentModal.fromJsonList(response.data);

        emit(DepartmentLoaded(departmentModal: departmentModals));
      } else {
        emit(DepartmentError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DepartmentError(error: handleDioError(e)));
    } catch (e) {
      emit(DepartmentError(error: 'Something Went Wrong'));
    }
  }
}
