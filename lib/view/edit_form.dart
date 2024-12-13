import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/cubit/anesthesia_cubit/anesthesia_cubit.dart';
import 'package:rpc_waiting_list/cubit/diagnosis_cubit/diagnosis_cubit.dart';
import 'package:rpc_waiting_list/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:rpc_waiting_list/cubit/edit_cubit/edit_cubit.dart';
import 'package:rpc_waiting_list/cubit/eua_cubit/eua_cubit.dart';
import 'package:rpc_waiting_list/cubit/eye_cubit/eye_cubit.dart';
import 'package:rpc_waiting_list/cubit/get_cubit/get_cubit.dart';
import 'package:rpc_waiting_list/cubit/plan_cubit/plan_cubit.dart';
import 'package:rpc_waiting_list/cubit/priority_cubit/priority_cubit.dart';
import 'package:rpc_waiting_list/cubit/short_cubit/short_cubit.dart';
import 'package:rpc_waiting_list/helper/user.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';

class EditDialog extends StatefulWidget {
  final int id;
  const EditDialog({super.key, required this.id});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _floors = [];

  int? id;
  DateTime? initialDate;
  DateTime? finalDate;
  int? demographic;
  int? diagnosis;
  int? plan;
  int? eye;
  int? priority;
  int? anesthesia;
  int? eua;
  int? short;
  int? cabin;
  int? advice;
  final _remarkController = TextEditingController();
  String? ptSurgery;
  final List<String> ynList = ['Yes','No'];

  @override
  void initState() {
    BlocProvider.of<GetCubit>(context).getReq(widget.id);
    BlocProvider.of<DiagnosisCubit>(context).getDiagnosis();
    BlocProvider.of<PlanCubit>(context).getPlan();
    BlocProvider.of<EyeCubit>(context).getEye();
    BlocProvider.of<PriorityCubit>(context).getPriority();
    BlocProvider.of<AnesthesiaCubit>(context).getAnesthesia();
    BlocProvider.of<EUACubit>(context).getEUA();
    BlocProvider.of<ShortCubit>(context).getShort();
    BlocProvider.of<DoctorCubit>(context).getDoctor();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<EditCubit, EditState>(
          listener: (context, state) {
            if (state is EditLoaded) {
              Navigator.of(context).pop();
            }
          },
          child: BlocListener<GetCubit, GetState>(
            listener: (context, state) {
              if (state is GetLoaded) {
                final adviceObj = state.adviceModal;
                id = adviceObj.id;
                demographic = adviceObj.patientdemographicId;
                diagnosis = adviceObj.diagnosisId;
                plan = adviceObj.planId;
                eye = adviceObj.eyeId;
                priority = adviceObj.priorityId;
                anesthesia = adviceObj.anesthesiaId;
                eua = adviceObj.euaId;
                short = adviceObj.shortId;
                cabin = adviceObj.cabinId;
                advice = adviceObj.adviceById;
                _remarkController.text = adviceObj.remark ?? "";
                initialDate = adviceObj.initialDate;
                initialDate = adviceObj.finalDate;
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: BlocBuilder<DiagnosisCubit, DiagnosisState>(
                      builder: (context, state) {
                        if (state is DiagnosisLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Diagnosis',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: diagnosis,
                            items: state.diagnosisModal
                                .map<DropdownMenuItem<int>>((Diagnosis modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                diagnosis = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) => value == null
                                ? 'Please select a Diagnosis'
                                : null,
                          );
                        }
                        return dummyDropDown('Select Diagnosis');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<PlanCubit, PlanState>(
                      builder: (context, state) {
                        if (state is PlanLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Plan',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: plan,
                            items: state.planModal
                                .map<DropdownMenuItem<int>>((Plan modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                plan = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'Please select a Plan' : null,
                          );
                        }
                        return dummyDropDown('Select Plan');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<EyeCubit, EyeState>(
                      builder: (context, state) {
                        if (state is EyeLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Eye',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: eye,
                            items: state.eyeModal
                                .map<DropdownMenuItem<int>>((Eye modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                eye = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'Please select an Eye' : null,
                          );
                        }
                        return dummyDropDown('Select Eye');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<PriorityCubit, PriorityState>(
                      builder: (context, state) {
                        if (state is PriorityLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Priority',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: priority,
                            items: state.priorityModal
                                .map<DropdownMenuItem<int>>((Priority modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                priority = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) => value == null
                                ? 'Please select a Priority'
                                : null,
                          );
                        }
                        return dummyDropDown('Select Priority');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<AnesthesiaCubit, AnesthesiaState>(
                      builder: (context, state) {
                        if (state is AnesthesiaLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Anesthesia',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: anesthesia,
                            items: state.anesthesiaModal
                                .map<DropdownMenuItem<int>>((Anesthesia modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                anesthesia = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) => value == null
                                ? 'Please select a Anesthesia'
                                : null,
                          );
                        }
                        return dummyDropDown('Select Anesthesia');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<EUACubit, EUAState>(
                      builder: (context, state) {
                        if (state is EUALoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select EUA',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: eua,
                            items: state.euaModal
                                .map<DropdownMenuItem<int>>((EUA modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                eua = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'Please select a EUA' : null,
                          );
                        }
                        return dummyDropDown('Select EUA');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<ShortCubit, ShortState>(
                      builder: (context, state) {
                        if (state is ShortLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Short',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: short,
                            items: state.shortModal
                                .map<DropdownMenuItem<int>>((Short modal) {
                              return DropdownMenuItem<int>(
                                value: modal.id,
                                child: Text(modal.value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                short = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'Please select a Short' : null,
                          );
                        }
                        return dummyDropDown('Select Short');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<DoctorCubit, DoctorState>(
                      builder: (context, state) {
                        if (state is DoctorLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Advice By',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: advice,
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
                                advice = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) => value == null
                                ? 'Please select a Advised By'
                                : null,
                          );
                        }
                        return dummyDropDown('Select Advised By');
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: BlocBuilder<DoctorCubit, DoctorState>(
                      builder: (context, state) {
                        if (state is DoctorLoaded) {
                          return DropdownButtonFormField<int>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Select Cabin',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              border: const OutlineInputBorder(),
                            ),
                            value: cabin,
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
                                cabin = newValue;
                              });
                            },
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'Please select a Cabin' : null,
                          );
                        }
                        return dummyDropDown('Select Cabin');
                      },
                    ),
                  ),                    SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Select Cabin',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: const OutlineInputBorder(),
                      ),
                      value: null,
                      items: ynList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          ptSurgery = newValue;
                        });
                      },
                      isExpanded: true,
                      isDense: true,
                      validator: (value) => value == null
                          ? 'Please select a value'
                          : null,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: TextFormField(
                      controller: _remarkController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Remark',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 3.sp),
                        contentPadding: const EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(15.r)),
                      ),
                      enabled: false,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          LocalUser localUser = LocalUser();
                          if (_formKey.currentState!.validate()) {
                            User? user = await localUser.getUser();
                            
                            final cadreId = user?.cadreId;
                            final userId =
                                cadreId == 2 ? user?.id : user?.parentId;
                            final adviceObj = Advice(
                                id: id,
                                adviceById: advice ?? 0,
                                anesthesiaId: anesthesia ?? 0,
                                cabinId: cabin ?? 0,
                                diagnosisId: diagnosis ?? 0,
                                euaId: eua ?? 0,
                                eyeId: eye ?? 0,
                                finalDate: finalDate ?? DateTime.now(),
                                initialDate: initialDate ?? DateTime.now(),
                                patientdemographicId: demographic ?? 0,
                                planId: plan ?? 0,
                                priorityId: priority ?? 0,
                                shortId: short ?? 0,
                                userId: userId ?? 0,
                                ptSurgery: ptSurgery ?? "Yes"
                            );

                            BlocProvider.of<EditCubit>(context)
                                .editReq(adviceObj, context);

                            // Submit form logic for Advice
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
