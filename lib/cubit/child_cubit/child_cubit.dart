import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/child_cubit/child_repo.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'child_state.dart';

class ChildCubit extends Cubit<ChildState> {
  ChildCubit() : super(ChildInitial());

  void getChild() async {
    emit(ChildLoading());
    try {
      final response = await ChildRepo().getChild();

      if (response.statusCode == 200) {
        List<User> userModal = User.fromJsonList(response.data);
        emit(ChildLoaded(query: 1, userModal: userModal));
      } else {
        emit(ChildError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ChildError(error: handleDioError(e)));
    } catch (e) {
      emit(ChildError(error: 'Something Went Wrong'));
    }
  }

  void verifyChild(int user) async {
    emit(ChildLoading());
    try {
      final response = await ChildRepo().verifyChild(user);

      if (response.statusCode == 200) {
        emit(ChildLoaded(query: 2, userModal: const []));
      } else {
        emit(ChildError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ChildError(error: handleDioError(e)));
    } catch (e) {
      emit(ChildError(error: 'Something Went Wrong'));
    }
  }
}
