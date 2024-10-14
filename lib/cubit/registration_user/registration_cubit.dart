import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rpc_waiting_list/cubit/registration_user/registration_repo.dart';

import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import '../../helper/dio_error_helper.dart';

part 'registration_state.dart';

class RegistrationUserCubit extends Cubit<RegistrationUserState> {
  RegistrationUserCubit() : super(RegistrationUserInitial());

  void loginReq({
    required int designationId,
    required String email,
    required String employeeId,
    required String firstName,
    required String middleName,
    required String lastName,
    required String mobile,
    required int cadreId,
    required int departmentId,
    required int officeAddressId,
    required int unitId,
  }) async {
    emit(RegistrationUserLoading());
    try {
      final response = await RegistrationUserRepo().registrationReq(
        email: email,
        employeeId: employeeId,
        firstName: firstName,
        designationId: designationId,
        middleName: middleName,
        lastName: lastName,
        mobile: mobile,
        cadreId: cadreId,
        departmentId: departmentId,
        officeAddressId: officeAddressId,
        unitId: unitId,
      );

      if (response.statusCode == 200) {
        RegistrationUserModal userModal =
            RegistrationUserModal.fromJson(response.data);

        emit(RegistrationUserLoaded(userModal: userModal));
      } else {
        emit(RegistrationUserError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(RegistrationUserError(error: handleDioError(e)));
    } catch (e) {
      emit(RegistrationUserError(error: 'Something Went Wrong'));
    }
  }
}
