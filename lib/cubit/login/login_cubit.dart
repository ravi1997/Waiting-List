import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/login/login_repo.dart';
import 'package:rpc_waiting_list/helper/token.dart';

import '../../helper/dio_error_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LocalToken localToken = LocalToken();

  void loginReq({required String id, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await LoginRepo().loginReq(id: id, password: password);

      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];

        localToken.writeAccessToken(accessToken);

        print("accesstoken :${accessToken}");

        emit(LoginLoaded());
      } else {
        emit(LoginError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(LoginError(error: handleDioError(e)));
    } catch (e) {
      emit(LoginError(error: 'Something Went Wrong'));
    }
  }
}
