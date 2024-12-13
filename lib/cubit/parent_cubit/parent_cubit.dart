import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/parent_cubit/parent_repo.dart';

import '../../helper/dio_error_helper.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(ParentInitial());

  void setParent(int user) async {
    emit(ParentLoading());
    try {
      final response = await ParentRepo().setParent(user);

      if (response.statusCode == 200) {
        emit(ParentLoaded());
      } else {
        emit(ParentError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ParentError(error: handleDioError(e)));
    } catch (e) {
      emit(ParentError(error: 'Something Went Wrong'));
    }
  }
}
