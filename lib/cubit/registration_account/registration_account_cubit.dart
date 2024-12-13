import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/registration_account/registration_account_repo.dart';

import '../../helper/dio_error_helper.dart';

part 'registration_account_state.dart';

class RegistrationAccountCubit extends Cubit<RegistrationAccountState> {
  RegistrationAccountCubit() : super(RegistrationAccountInitial());

  void loginReq({
    required String username,
    required String password,
    required String userId,
  }) async {
    emit(RegistrationAccountLoading());
    try {
      final response = await RegistrationAccountRepo().registrationReq(
          password: password, userId: userId, username: username);

      if (response.statusCode == 200) {
        emit(RegistrationAccountLoaded());
      } else {
        emit(RegistrationAccountError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(RegistrationAccountError(error: handleDioError(e)));
    } catch (e) {
      emit(RegistrationAccountError(error: 'Something Went Wrong'));
    }
  }
}
