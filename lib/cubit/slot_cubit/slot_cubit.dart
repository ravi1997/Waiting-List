import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/slot_cubit/slot_repo.dart';
import 'package:rpc_waiting_list/modal/patient_entry.dart';

import '../../helper/dio_error_helper.dart';

part 'slot_state.dart';

class SlotCubit extends Cubit<SlotState> {
  SlotCubit() : super(SlotInitial());

  void getSlot() async {
    emit(SlotLoading());
    try {
      final response = await SlotRepo().getSlotRepo();

      if (response.statusCode == 200) {
        // print("Successfull query");

        List<PatientEntry> patientEntryModal =
            PatientEntry.fromJsonList(response.data['patients']);

        // print("ready to emit");

        emit(SlotLoaded(patientEntryModal: patientEntryModal));
      } else {
        emit(SlotError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(SlotError(error: handleDioError(e)));
    } catch (e) {
      emit(SlotError(error: 'Something Went Wrong'));
    }
  }
}
