import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rpc_waiting_list/components/redate.dart';
import 'package:rpc_waiting_list/cubit/advice_cubit/advice_cubit.dart';
import 'package:rpc_waiting_list/cubit/edit_cubit/edit_cubit.dart';
import 'package:rpc_waiting_list/cubit/patient_cubit/patient_cubit.dart';
import 'package:rpc_waiting_list/cubit/patient_entry_delete_cubit/delete_cubit.dart';
import 'package:rpc_waiting_list/cubit/redate_cubit/redate_cubit.dart';
import 'package:rpc_waiting_list/cubit/slot_cubit/slot_cubit.dart';
import 'package:rpc_waiting_list/view/edit_form.dart';
import 'package:rpc_waiting_list/view/patient_form_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({super.key});

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime old = DateTime.now();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SlotCubit>(context).getSlot();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotCubit, SlotState>(
      builder: (context, state) {
        if (state is SlotLoaded) {
          final slotsForSelectedDay = state.patientEntryModal
              .where((slot) => isSameDay(slot.finalDate, _selectedDay))
              .toList();
          return Column(
            children: [
              TableCalendar(
                focusedDay: _selectedDay,
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(DateTime.now().year + 10, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: _onDaySelected,
                eventLoader: (day) {
                  return state.patientEntryModal
                      .where((slot) => isSameDay(slot.finalDate, day))
                      .toList();
                },
              ),
              if (slotsForSelectedDay.length < 15)
                BlocListener<AdviceCubit, AdviceState>(
                  listener: (context, state) {
                    if (state is AdviceLoaded) {
                      BlocProvider.of<SlotCubit>(context).getSlot();
                      setState(() {});
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BlocProvider(
                            create: (context) => PatientCubit(),
                            child:
                                PatientFormDialog(selectedDate: _selectedDay),
                          );
                        },
                      );
                    },
                    child: const Text('Add Slot'),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('S.No')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('DOB')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Diagnosis')),
                      DataColumn(label: Text('Plan')),
                      DataColumn(label: Text('Anesthesia')),
                      DataColumn(label: Text('Priority')),
                      DataColumn(label: Text('Short')),
                      DataColumn(label: Text('EUA')),
                      DataColumn(label: Text('Cabin')),
                      DataColumn(label: Text('Advice By')),
                      DataColumn(label: Text('Initial Date')),
                      DataColumn(label: Text('Final Date')),
                      DataColumn(label: Text('Remark')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: List.generate(slotsForSelectedDay.length, (index) {
                      final slot = slotsForSelectedDay[index];
                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                      return DataRow(cells: [
                        DataCell(Text('${index + 1}')), // Display index + 1
                        DataCell(Text(
                            '${slot.patientDemographic.fname} ${slot.patientDemographic.mname} ${slot.patientDemographic.lname}')),
                        DataCell(Text(
                            formatter.format(slot.patientDemographic.dob))),
                        DataCell(Text(slot.patientDemographic.phoneNo)),
                        DataCell(Text(slot.diagnosis)),
                        DataCell(Text(slot.plan)),
                        DataCell(Text(slot.anesthesia)),
                        DataCell(Text(slot.priority)),
                        DataCell(Text(slot.short)),
                        DataCell(Text(slot.eua)),
                        DataCell(Text(slot.cabin)),
                        DataCell(Text(slot.adviceBy)),
                        DataCell(Text(formatter.format(slot.initialDate))),
                        DataCell(Text(formatter.format(slot.finalDate))),
                        DataCell(Text(slot.remark ?? '')),
                        DataCell(Row(
                          children: [
                            BlocListener<EditCubit, EditState>(
                              listener: (context, state) {
                                if (state is EditLoaded) {
                                  Navigator.of(state.context).pop();
                                  BlocProvider.of<SlotCubit>(context).getSlot();
                                  setState(() {});
                                }
                              },
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                color: Colors.black,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BlocProvider(
                                        create: (context) => EditCubit(),
                                        child: EditDialog(id: slot.id),
                                      );
                                    },
                                  ).then((_) {
                                    // Ensure dialog is closed after EditCubit completes
                                    BlocProvider.of<SlotCubit>(context)
                                        .getSlot();
                                    setState(() {});
                                  });
                                },
                              ),
                            ),
                            BlocListener<RedateCubit, RedateState>(
                              listener: (context, state) {
                                if (state is RedateLoaded) {
                                  BlocProvider.of<SlotCubit>(context).getSlot();
                                  setState(() {});
                                }
                              },
                              child: IconButton(
                                icon: const Icon(Icons.date_range),
                                color: Colors.black,
                                onPressed: () {
                                  Redate.showDialogBox(context, slot.id);
                                },
                              ),
                            ),
                            BlocListener<DeleteCubit, DeleteState>(
                              listener: (context, state) {
                                if (state is DeleteLoaded) {
                                  BlocProvider.of<SlotCubit>(context).getSlot();
                                  setState(() {});
                                }
                              },
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Deletion'),
                                        content: const Text(
                                            'Are you sure you want to delete the patient entry?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Delete'),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                              BlocProvider.of<DeleteCubit>(
                                                      context)
                                                  .deleteReq(slot.id);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ))
                      ]);
                    }),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
