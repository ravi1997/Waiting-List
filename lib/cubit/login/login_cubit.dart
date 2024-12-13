import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rpc_waiting_list/cubit/login/login_repo.dart';
import 'package:rpc_waiting_list/helper/account.dart';
import 'package:rpc_waiting_list/helper/token.dart';
import 'package:rpc_waiting_list/helper/user.dart';
import 'package:rpc_waiting_list/modal/login_modal.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LocalToken localToken = LocalToken();
  LocalAccount localAccount = LocalAccount();
  LocalUser localUser = LocalUser();

  void loginReq({required String id, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await LoginRepo().loginReq(id: id, password: password);

      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];
        final account = response.data['account'];
        final user = response.data['user'];
        // print(account);
        localToken.writeAccessToken(accessToken);
        localAccount.writeAccount(Account.fromJson(account));
        localUser.writeUser(User.fromJson(user));

        if (kDebugMode) {
          print("accesstoken :$accessToken");
        }

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
