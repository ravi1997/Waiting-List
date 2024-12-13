import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/building_cubit/building_repo.dart';
import 'package:rpc_waiting_list/modal/building_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'building_state.dart';

class BuildingCubit extends Cubit<BuildingState> {
  BuildingCubit() : super(BuildingInitial());

  void getBuilding() async {
    emit(BuildingLoading());
    try {
      final response = await BuildingRepo().getBuildingRepo();

      if (response.statusCode == 200) {
        List<BuildingModal> buildingModal =
            BuildingModal.fromJsonList(response.data);

        emit(BuildingLoaded(buildingModal: buildingModal));
      } else {
        emit(BuildingError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(BuildingError(error: handleDioError(e)));
    } catch (e) {
      emit(BuildingError(error: 'Something Went Wrong'));
    }
  }
}
