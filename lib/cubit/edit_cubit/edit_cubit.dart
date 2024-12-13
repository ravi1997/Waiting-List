import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

import '../../helper/dio_error_helper.dart';
import 'edit_repo.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());

  void editReq(Advice advice, BuildContext context) async {
    emit(EditLoading());
    try {
      final response = await EditRepo().editReq(advice);
      if (response.statusCode == 200) {
        emit(EditLoaded(context: context));
      } else {
        emit(EditError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(EditError(error: handleDioError(e)));
    } catch (e) {
      // print(e);
      emit(EditError(error: 'Something Went Wrong'));
    }
  }
}
