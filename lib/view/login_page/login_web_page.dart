import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/view/login_page/register_form_widget.dart';
import 'package:rpc_waiting_list/view/menu_item.dart';

import '../../components/typing_animation.dart';
import 'login_form_widget.dart';

class LoginPageWeb extends StatefulWidget {
  const LoginPageWeb({super.key});

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: const [
          Menu(),
          Body(),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoginPressed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is less than a threshold value (e.g., 600px)
          bool isMobile = constraints.maxWidth < 600;
          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200.h,
                        child: const TypingAnimation(
                            text:
                                "Hello, There!\nLogin to the R.P.Centre Applications."),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _loginButton(onTap: () {
                          setState(() {
                            isLoginPressed = true;
                          });
                        }),
                        SizedBox(width: 10.w),
                        _registerButton(onTap: () {
                          setState(() {
                            isLoginPressed = false;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: isLoginPressed
                          ? const LoginFormWidget()
                          : const RegisterFormWidget(),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TypingAnimation(
                              text:
                                  "Hello, There!\nLogin to the R.P.Centre Applications."),
                        ],
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _loginButton(onTap: () {
                                setState(() {
                                  isLoginPressed = true;
                                });
                              }),
                              SizedBox(width: 2.w),
                              _registerButton(onTap: () {
                                setState(() {
                                  isLoginPressed = false;
                                });
                              }),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Container(
                            child: isLoginPressed
                                ? const LoginFormWidget()
                                : const RegisterFormWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _loginButton({required final VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
