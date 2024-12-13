import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/cubit/advice_cubit/advice_cubit.dart';
import 'package:rpc_waiting_list/cubit/anesthesia_cubit/anesthesia_cubit.dart';
import 'package:rpc_waiting_list/cubit/building_cubit/building_cubit.dart';
import 'package:rpc_waiting_list/cubit/cadre_cubit/cadre_cubit.dart';
import 'package:rpc_waiting_list/cubit/child_cubit/child_cubit.dart';
import 'package:rpc_waiting_list/cubit/department_cubit/department_cubit.dart';
import 'package:rpc_waiting_list/cubit/designation_cubit/designation_cubit.dart';
import 'package:rpc_waiting_list/cubit/diagnosis_cubit/diagnosis_cubit.dart';
import 'package:rpc_waiting_list/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:rpc_waiting_list/cubit/edit_cubit/edit_cubit.dart';
import 'package:rpc_waiting_list/cubit/eua_cubit/eua_cubit.dart';
import 'package:rpc_waiting_list/cubit/eye_cubit/eye_cubit.dart';
import 'package:rpc_waiting_list/cubit/floor_cubit/floor_cubit.dart';
import 'package:rpc_waiting_list/cubit/get_cubit/get_cubit.dart';
import 'package:rpc_waiting_list/cubit/login/login_cubit.dart';
import 'package:rpc_waiting_list/cubit/logout/logout_cubit.dart';
import 'package:rpc_waiting_list/cubit/parent_cubit/parent_cubit.dart';
import 'package:rpc_waiting_list/cubit/patient_cubit/patient_cubit.dart';
import 'package:rpc_waiting_list/cubit/patient_entry_delete_cubit/delete_cubit.dart';
import 'package:rpc_waiting_list/cubit/plan_cubit/plan_cubit.dart';
import 'package:rpc_waiting_list/cubit/priority_cubit/priority_cubit.dart';
import 'package:rpc_waiting_list/cubit/redate_cubit/redate_cubit.dart';
import 'package:rpc_waiting_list/cubit/registration_user/registration_cubit.dart';
import 'package:rpc_waiting_list/cubit/room_cubit/room_cubit.dart';
import 'package:rpc_waiting_list/cubit/short_cubit/short_cubit.dart';
import 'package:rpc_waiting_list/cubit/unit_cubit/unit_cubit.dart';
import 'package:rpc_waiting_list/view/login_page/login_web_page.dart';

import 'cubit/forgot_password/forgot_password_cubit.dart';
import 'cubit/registration_account/registration_account_cubit.dart';
import 'cubit/slot_cubit/slot_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CadreCubit()),
          BlocProvider(create: (context) => PatientCubit()),
          BlocProvider(create: (context) => DesignationCubit()),
          BlocProvider(create: (context) => LogoutCubit()),
          BlocProvider(create: (context) => UnitCubit()),
          BlocProvider(create: (context) => DepartmentCubit()),
          BlocProvider(create: (context) => BuildingCubit()),
          BlocProvider(create: (context) => RoomCubit()),
          BlocProvider(create: (context) => FloorCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegistrationUserCubit()),
          BlocProvider(create: (context) => RegistrationAccountCubit()),
          BlocProvider(create: (context) => ForgotPasswordCubit()),
          BlocProvider(create: (context) => SlotCubit()),
          BlocProvider(create: (context) => DiagnosisCubit()),
          BlocProvider(create: (context) => PlanCubit()),
          BlocProvider(create: (context) => EyeCubit()),
          BlocProvider(create: (context) => PriorityCubit()),
          BlocProvider(create: (context) => AnesthesiaCubit()),
          BlocProvider(create: (context) => EUACubit()),
          BlocProvider(create: (context) => ShortCubit()),
          BlocProvider(create: (context) => DoctorCubit()),
          BlocProvider(create: (context) => AdviceCubit()),
          BlocProvider(create: (context) => DeleteCubit()),
          BlocProvider(create: (context) => RedateCubit()),
          BlocProvider(create: (context) => EditCubit()),
          BlocProvider(create: (context) => GetCubit()),
          BlocProvider(create: (context) => ChildCubit()),
          BlocProvider(create: (context) => ParentCubit()),
        ],
        child: MaterialApp(
          title: 'RPC WAITING LIST',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPageWeb(),
        ),
      ),
    );
  }
}
