import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/cubit/building_cubit/building_cubit.dart';
import 'package:rpc_waiting_list/cubit/cadre_cubit/cadre_cubit.dart';
import 'package:rpc_waiting_list/cubit/department_cubit/department_cubit.dart';
import 'package:rpc_waiting_list/modal/building_modal.dart';
import 'package:rpc_waiting_list/view/login_page/login_form_widget.dart';
import 'package:rpc_waiting_list/view/login_page/register_form_widget.dart';
import 'package:rpc_waiting_list/view/menu_item.dart';

class LoginPageWeb extends StatefulWidget {
  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  @override
  void initState() {
    BlocProvider.of<BuildingCubit>(context).getBuilding();
    BlocProvider.of<CadreCubit>(context).getCadre();
    BlocProvider.of<DepartmentCubit>(context).getDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [
          Menu(),
          Body(),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoginPressed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In to \n RPC Waiting List Application',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'images/illustration-2.png',
                        width: 80.w,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'images/illustration-1.png',
                  width: 70.w,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50.w,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // menuItem(title: 'Sign In', isActive: true),
                    _loginButton(
                        onTap: () => setState(() {
                              isLoginPressed = true;
                            })),
                    SizedBox(width: 2.w),
                    _registerButton(onTap: () {
                      setState(() {
                        isLoginPressed = false;
                      });
                    }),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  // width: 400,
                  child:
                      isLoginPressed ? LoginFormWidget() : RegisterFormWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _loginButton({required final VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 10,
              blurRadius: 12,
            ),
          ],
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _registerButton({required final VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 10,
              blurRadius: 12,
            ),
          ],
        ),
        child: const Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
