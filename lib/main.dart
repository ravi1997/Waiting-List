import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/cubit/building_cubit/building_cubit.dart';
import 'package:rpc_waiting_list/cubit/cadre_cubit/cadre_cubit.dart';
import 'package:rpc_waiting_list/cubit/department_cubit/department_cubit.dart';
import 'package:rpc_waiting_list/cubit/designation_cubit/designation_cubit.dart';
import 'package:rpc_waiting_list/cubit/floor_cubit/floor_cubit.dart';
import 'package:rpc_waiting_list/cubit/login/login_cubit.dart';
import 'package:rpc_waiting_list/cubit/logout/logout_cubit.dart';
import 'package:rpc_waiting_list/cubit/registration_user/registration_cubit.dart';
import 'package:rpc_waiting_list/cubit/room_cubit/room_cubit.dart';
import 'package:rpc_waiting_list/cubit/unit_cubit/unit_cubit.dart';
import 'package:rpc_waiting_list/view/login_page/login_web_page.dart';
import 'package:rpc_waiting_list/view/home_page.dart';
import 'cubit/forgot_password/forgot_password_cubit.dart';
import 'cubit/registration_account/registration_account_cubit.dart';

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
        ],
        child: MaterialApp(
          title: 'RPC WAITING LIST',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginPageWeb(),
        ),
      ),
    );
  }
}
