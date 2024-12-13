import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/designation_cubit/designation_repo.dart';
import 'package:rpc_waiting_list/modal/designation_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'designation_state.dart';

class DesignationCubit extends Cubit<DesignationState> {
  DesignationCubit() : super(DesignationInitial());

  void getDesignation({required String id}) async {
    emit(DesignationLoading());
    try {
      final response = await DesignationRepo().getDesignationRepo(id: id);

      if (response.statusCode == 200) {
        List<DesignationModal> designationModal =
            DesignationModal.fromJsonList(response.data);

        emit(DesignationLoaded(designationModal: designationModal));
      } else {
        emit(DesignationError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DesignationError(error: handleDioError(e)));
    } catch (e) {
      emit(DesignationError(error: 'Something Went Wrong'));
    }
  }

  void getAllDesignations() async {
    emit(DesignationLoading());
    try {
      final response = await DesignationRepo().getAllDesignation();

      if (response.statusCode == 200) {
        List<DesignationModal> designationModal =
            DesignationModal.fromJsonList(response.data);

        emit(DesignationLoaded(designationModal: designationModal));
      } else {
        emit(DesignationError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(DesignationError(error: handleDioError(e)));
    } catch (e) {
      emit(DesignationError(error: 'Something Went Wrong'));
    }
  }
}
