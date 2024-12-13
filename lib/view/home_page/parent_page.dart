import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpc_waiting_list/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:rpc_waiting_list/cubit/parent_cubit/parent_cubit.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  final _formKey = GlobalKey<FormState>();
  int? parent;
  final List<String> _floors = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DoctorCubit>(context).getDoctor();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ParentCubit, ParentState>(
      listener: (context, state) {
        if (state is ParentLoaded) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Information'),
                content: const Text('Parent User has been set successfully'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Center(
          child: Column(
        children: [
          const Text('Set Parent User'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                BlocBuilder<DoctorCubit, DoctorState>(
                  builder: (context, state) {
                    if (state is DoctorLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Parent User',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: const OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.doctorModal
                            .map<DropdownMenuItem<int>>((User modal) {
                          return DropdownMenuItem<int>(
                            value: modal.id,
                            child: Text(
                                '${modal.firstname} ${modal.middlename} ${modal.lastname}'),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            parent = newValue;
                          });
                        },
                        isExpanded: true,
                        isDense: true,
                        validator: (value) =>
                            value == null ? 'Please select a Advised By' : null,
                      );
                    }
                    return dummyDropDown('Select Advised By');
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ParentCubit>(context)
                          .setParent(parent ?? 0);
                      // Submit form logic for Advice
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  DropdownButtonFormField<String> dummyDropDown(String labelText) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.blueGrey[50],
        border: const OutlineInputBorder(),
      ),
      value: null,
      items: _floors.map((String floor) {
        return DropdownMenuItem<String>(
          value: floor,
          child: Text(floor.toString()),
        );
      }).toList(),
      onChanged: null,
      validator: (value) => value == null ? labelText : null,
    );
  }
}
