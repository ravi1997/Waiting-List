import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rpc_waiting_list/cubit/logout/logout_repo.dart';

import '../../helper/dio_error_helper.dart';
import '../../helper/token.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  LocalToken localToken = LocalToken();

  void logOutReq() async {
    emit(LogoutLoading());
    try {
      final response = await LogoutRepo().logoutReq();

      if (response.statusCode == 200) {
        localToken.writeAccessToken("");

        emit(LogoutLoaded());
      } else {
        emit(LogoutError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(LogoutError(error: handleDioError(e)));
    } catch (e) {
      emit(LogoutError(error: 'Something Went Wrong'));
    }
  }
}
