import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpc_waiting_list/cubit/building_cubit/building_cubit.dart';
import 'package:rpc_waiting_list/cubit/floor_cubit/floor_cubit.dart';
import 'package:rpc_waiting_list/cubit/room_cubit/room_cubit.dart';
import 'package:rpc_waiting_list/modal/building_modal.dart';
import 'package:rpc_waiting_list/modal/floor_modal.dart';
import 'package:rpc_waiting_list/modal/room_modal.dart';

import '../../components/my_textfield.dart';
import '../../cubit/cadre_cubit/cadre_cubit.dart';
import '../../cubit/department_cubit/department_cubit.dart';
import '../../cubit/designation_cubit/designation_cubit.dart';
import '../../cubit/registration_account/registration_account_cubit.dart';
import '../../cubit/registration_user/registration_cubit.dart';
import '../../cubit/unit_cubit/unit_cubit.dart';
import '../../helper/Utils.dart';
import '../../modal/cadre_modal.dart';
import '../../modal/department_modal.dart';
import '../../modal/designation_modal.dart';
import '../../modal/registration_user_modal.dart';
import '../../modal/unit_modal.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  // String selectedFloor = '1';
  int? selectedCadre;
  int? selectedDesignation;
  int? selectedUnit;
  int? selectedDepartment;
  int? selectedBuilding;
  int? selectedRoom;
  int? selectedFloor;
  List<String> _floors = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyTextField(
                  controller: _middleNameController,
                  label: 'Middle Name',
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your middle name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          MyTextField(
            controller: _employeeIdController,
            label: 'Employee Id',
            validatorFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your employee id';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  controller: _emailController,
                  label: 'Email',
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyTextField(
                  controller: _mobileNumberController,
                  label: 'Mobile Number',
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    } else if (value.length != 10) {
                      return 'Mobile number must be 10 digits';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<BuildingCubit, BuildingState>(
                  builder: (context, state) {
                    if (state is BuildingLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Building',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.buildingModal
                            .map<DropdownMenuItem<int>>((BuildingModal modal) {
                          return DropdownMenuItem<int>(
                            value: modal.id,
                            child: Text(modal.name),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          BlocProvider.of<RoomCubit>(context)
                              .getDesignation(id: newValue.toString());
                          setState(() {
                            selectedBuilding = newValue;
                          });
                        },
                        isExpanded: true,
                        isDense: true,
                        validator: (value) =>
                            value == null ? 'Please select a Building' : null,
                      );
                    }
                    return dummyDropDown('Select Building');
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BlocBuilder<RoomCubit, RoomState>(
                  builder: (context, state) {
                    if (state is RoomLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Room',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.roomModal
                            .map<DropdownMenuItem<int>>((RoomModal modal) {
                          return DropdownMenuItem<int>(
                            value: modal.id,
                            child: Text(modal.number.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          BlocProvider.of<FloorCubit>(context)
                              .getDesignation(id: newValue.toString());
                          setState(() {
                            selectedBuilding = newValue;
                          });
                        },
                        isExpanded: true,
                        isDense: true,
                        validator: (value) =>
                            value == null ? 'Please select a Room' : null,
                      );
                    }
                    return dummyDropDown('Select Room');
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BlocBuilder<FloorCubit, FloorState>(
                  builder: (context, state) {
                    if (state is FloorLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Floor',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.floorModal
                            .map<DropdownMenuItem<int>>((FloorModal modal) {
                          return DropdownMenuItem<int>(
                            value: modal.id,
                            child: Text(modal.number.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // BlocProvider.of<RoomCubit>(context)
                          //     .getDesignation(id: newValue.toString());
                          setState(() {
                            selectedBuilding = newValue;
                          });
                        },
                        isExpanded: true,
                        isDense: true,
                        validator: (value) =>
                            value == null ? 'Please select a Floor' : null,
                      );
                    }
                    return dummyDropDown('Select Floor');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: BlocBuilder<CadreCubit, CadreState>(
                builder: (context, state) {
                  if (state is CadreLoaded) {
                    return DropdownButtonFormField<int>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Select Cadre',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(),
                      ),
                      value: null,
                      items: state.cadreModal
                          .map<DropdownMenuItem<int>>((CadreModal modal) {
                        return DropdownMenuItem<int>(
                          value: modal.id,
                          child: Text(modal.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        BlocProvider.of<DesignationCubit>(context)
                            .getDesignation(id: newValue.toString());
                        setState(() {
                          selectedCadre = newValue;
                        });
                      },
                      isExpanded: true,
                      isDense: true,
                      validator: (value) =>
                          value == null ? 'Please select a Cadre' : null,
                    );
                  }
                  return dummyDropDown('Select Cadre');
                },
              )),
              SizedBox(width: 20),
              Expanded(child: BlocBuilder<DesignationCubit, DesignationState>(
                builder: (context, state) {
                  if (state is DesignationLoaded) {
                    return DropdownButtonFormField<int>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Select Designation',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(),
                      ),
                      value: null,
                      items: state.designationModal
                          .map((DesignationModal designation) {
                        return DropdownMenuItem<int>(
                          value: designation.id,
                          child: Text(designation.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedDesignation = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a designation' : null,
                    );
                  }
                  return dummyDropDown('Select Designation');
                },
              )),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<DepartmentCubit, DepartmentState>(
                  builder: (context, state) {
                    if (state is DepartmentLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Department',
                          labelStyle: TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.departmentModal
                            .map((DepartmentModal department) {
                          return DropdownMenuItem<int>(
                            value: department.id,
                            child: Text(
                              department.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          BlocProvider.of<UnitCubit>(context)
                              .getUnitRepo(id: newValue.toString());

                          setState(() {
                            selectedDepartment = newValue;
                          });
                        },
                        isExpanded: true,
                        isDense: true,
                        validator: (value) =>
                            value == null ? 'Please select a department' : null,
                      );
                    }
                    return dummyDropDown('Select Department');
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BlocBuilder<UnitCubit, UnitState>(
                  builder: (context, state) {
                    if (state is UnitLoaded) {
                      return DropdownButtonFormField<int>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select Unit',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(),
                        ),
                        value: null,
                        items: state.unitModal.map((UnitModal unit) {
                          return DropdownMenuItem<int>(
                            value: unit.id,
                            child: Text(unit.name),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedUnit = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Please select a unit' : null,
                      );
                    }
                    return dummyDropDown('Select Unit');
                  },
                ),
              ),
            ],
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
            child: BlocListener<RegistrationUserCubit, RegistrationUserState>(
              listener: (context, state) {
                if (state is RegistrationUserLoading) {
                  Utils.snackbarToast('Please Wait');
                }
                if (state is RegistrationUserLoaded) {
                  _showPasswordDialog(context, state.userModal);
                }
                if (state is RegistrationUserError) {
                  Utils.snackbarToast('Something Went Wrong');
                }
              },
              child: ElevatedButton(
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text("Sign Up"))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<RegistrationUserCubit>(context).loginReq(
                        designationId: selectedDesignation!,
                        email: _emailController.text.trim(),
                        employeeId: _employeeIdController.text.trim(),
                        firstName: _firstNameController.text.trim(),
                        middleName: _middleNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                        mobile: _mobileNumberController.text.trim(),
                        cadreId: selectedCadre!,
                        departmentId: selectedDepartment!,
                        officeAddressId: selectedDesignation!,
                        unitId: selectedUnit!);
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
          SizedBox(height: 40),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> dummyDropDown(String labelText) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.blueGrey[50],
        border: OutlineInputBorder(),
      ),
      value: null,
      items: _floors.map((String floor) {
        return DropdownMenuItem<String>(
          value: floor,
          child: Text(floor.toString()),
        );
      }).toList(),
      onChanged: null,
      validator: (value) => value == null ? 'Please select a floor' : null,
    );
  }

  void _showPasswordDialog(
      BuildContext context, RegistrationUserModal registrationUserModal) {
    final TextEditingController _passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'UserName ${registrationUserModal.user?.email}\nEnter Password'),
          content: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            BlocListener<RegistrationAccountCubit, RegistrationAccountState>(
              listener: (context, state) {
                if (state is RegistrationAccountLoading) {
                  Utils.snackbarToast('Please Wait');
                }
                if (state is RegistrationAccountLoaded) {
                  Navigator.pop(context);
                  Utils.snackbarToast('Wait for Account Verification');
                }
                if (state is RegistrationAccountError) {
                  Utils.snackbarToast('Something Went Wrong');
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RegistrationAccountCubit>(context).loginReq(
                      username: registrationUserModal.user?.email ?? '',
                      password: _passwordController.text.trim(),
                      userId: registrationUserModal.user?.id.toString() ?? '');
                },
                child: Text('Register'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _employeeIdController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();

    super.dispose();
  }
}
