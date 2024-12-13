import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpc_waiting_list/cubit/advice_cubit/advice_cubit.dart';
import 'package:rpc_waiting_list/cubit/anesthesia_cubit/anesthesia_cubit.dart';
import 'package:rpc_waiting_list/cubit/diagnosis_cubit/diagnosis_cubit.dart';
import 'package:rpc_waiting_list/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:rpc_waiting_list/cubit/eua_cubit/eua_cubit.dart';
import 'package:rpc_waiting_list/cubit/eye_cubit/eye_cubit.dart';
import 'package:rpc_waiting_list/cubit/patient_cubit/patient_cubit.dart';
import 'package:rpc_waiting_list/cubit/plan_cubit/plan_cubit.dart';
import 'package:rpc_waiting_list/cubit/priority_cubit/priority_cubit.dart';
import 'package:rpc_waiting_list/cubit/short_cubit/short_cubit.dart';
import 'package:rpc_waiting_list/helper/user.dart';
import 'package:rpc_waiting_list/helper/utils.dart';
import 'package:rpc_waiting_list/modal/patient_demographic.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';
import 'package:rpc_waiting_list/modal/slot_modal.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../components/customtextformfield.dart';

class PatientFormDialog extends StatefulWidget {
  final DateTime selectedDate;
  const PatientFormDialog({super.key, required this.selectedDate});

  @override
  State<PatientFormDialog> createState() => _PatientFormDialogState();
}

class _PatientFormDialogState extends State<PatientFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _uhidController = TextEditingController();
  final _fnameController = TextEditingController();
  final _mnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _phoneNo1Controller = TextEditingController();
  final List<String> _floors = [];
  late PatientDemographic _demographic;
  final List<String> ynList = ['Yes','No'];
  int? diagnosis;
  int? plan;
  int? eye;
  int? priority;
  int? anesthesia;
  int? eua;
  int? short;
  int? cabin;
  int? advice;
  String? ptSurgery;
  final _remarkController = TextEditingController();

  bool _showAdviceForm = false;

  @override
  void initState() {
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

  void _fetchPatientData() {
    BlocProvider.of<PatientCubit>(context)
        .fetchPatientByUHID(_uhidController.text);
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

  // Method to open the scanner page and handle the result
  void scanBarcode() async {
    // Use simple_barcode_scanner to scan the barcode
    String? barcode = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Test',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
      cameraFace: CameraFace.back,
    );

    // If a barcode is returned, fill the text field
    if (barcode != null && barcode.isNotEmpty) {
      setState(() {
        _uhidController.text = barcode; // Set the scanned barcode value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<PatientCubit, PatientState>(
            listener: (context, state) {
              if (state is PatientLoaded) {
                final patient = state.patientModal;
                _fnameController.text = patient.fname;
                _mnameController.text = patient.mname;
                _lnameController.text = patient.lname;
                _dobController.text = patient.dob.toIso8601String();
                _genderController.text = patient.gender;
                _phoneNoController.text = patient.phoneNo;
                _phoneNo1Controller.text = patient.phoneNo1 ?? '';
                _demographic = patient;
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_showAdviceForm) ...[
                    Expanded(child: ElevatedButton(
                      onPressed: scanBarcode,
                      child: Text('Scan Barcode'),
                    ),),
                    SizedBox(height: 10.h),

                    Expanded(
                      child: TextFormField(
                        controller: _uhidController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'UHID',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter UHID';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: _fetchPatientData,
                      child: const Text('Fetch'),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _fnameController,
                      labelText: 'First Name',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _mnameController,
                      labelText: 'Middle Name',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _lnameController,
                      labelText: 'Last Name',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _dobController,
                      labelText: 'Date of Birth',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _genderController,
                      labelText: 'Gender',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _phoneNoController,
                      labelText: 'Phone Number',
                      enabled: false,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: _phoneNo1Controller,
                      labelText: 'Alternate Phone Number',
                      enabled: true,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _showAdviceForm = true;
                              });
                            }
                          },
                          child: const Text('Next'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Set the button color to red
                          ),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ] else ...[
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
                              value: null,
                              items: state.diagnosisModal
                                  .map<DropdownMenuItem<int>>(
                                      (Diagnosis modal) {
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
                              value: null,
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
                              value: null,
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
                              value: null,
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
                              value: null,
                              items: state.anesthesiaModal
                                  .map<DropdownMenuItem<int>>(
                                      (Anesthesia modal) {
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
                              value: null,
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
                                labelText: 'Select SA/DC',
                                filled: true,
                                fillColor: Colors.blueGrey[50],
                                border: const OutlineInputBorder(),
                              ),
                              value: null,
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
                              validator: (value) => value == null
                                  ? 'Please select a Short'
                                  : null,
                            );
                          }
                          return dummyDropDown('Select SA/DC');
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
                                  cabin = newValue;
                                });
                              },
                              isExpanded: true,
                              isDense: true,
                              validator: (value) => value == null
                                  ? 'Please select a Cabin'
                                  : null,
                            );
                          }
                          return dummyDropDown('Select Cabin');
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Select PT surgery',
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
                                  adviceById: advice ?? 0,
                                  anesthesiaId: anesthesia ?? 0,
                                  cabinId: cabin ?? 0,
                                  diagnosisId: diagnosis ?? 0,
                                  euaId: eua ?? 0,
                                  eyeId: eye ?? 0,
                                  finalDate: widget.selectedDate,
                                  initialDate: widget.selectedDate,
                                  patientdemographicId: _demographic.id,
                                  planId: plan ?? 0,
                                  priorityId: priority ?? 0,
                                  shortId: short ?? 0,
                                  userId: userId ?? 0,
                                  ptSurgery: ptSurgery ?? "Yes"
                              );

                              BlocProvider.of<AdviceCubit>(context).adviceReq(
                                  advice: adviceObj,
                                  patientDemographic: _demographic);
                              Navigator.of(context).pop();
                              // Submit form logic for Advice
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showAdviceForm = false;
                            });
                          },
                          child: const Text('Back'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e, stack) {
      Utils.logger.i("Something went wrong");
      Utils.logger.e(e);
      Utils.logger.e(stack);
      return Dialog(
          child:
              Padding(padding: const EdgeInsets.all(16.0), child: Container()));
    }
  }
}
