import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/my_textfield.dart';
import '../../cubit/login/login_cubit.dart';
import '../home_page.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            controller: _idController,
            label: 'Enter email or Phone number',
            keyboardType: TextInputType.emailAddress,
            validatorFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email or phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          MyTextField(
            controller: _passwordController,
            label: 'Password',
            obscured: true,
            suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
            validatorFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade50,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoaded) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              child: ElevatedButton(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Sign In")),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final id = _idController.text.trim();
                    final password = _passwordController.text.trim();
                    BlocProvider.of<LoginCubit>(context)
                        .loginReq(id: id, password: password);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
