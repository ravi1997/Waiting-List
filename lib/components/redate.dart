import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rpc_waiting_list/cubit/redate_cubit/redate_cubit.dart';
import 'package:rpc_waiting_list/cubit/slot_cubit/slot_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class Redate extends StatefulWidget {
  final int id;
  const Redate({super.key, required this.id});

  @override
  State<Redate> createState() => _RedateState();

  // Add a static method to show the dialog
  static void showDialogBox(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<SlotCubit>(context),
          child: Redate(id: id),
        );
      },
    );
  }
}

class _RedateState extends State<Redate> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SlotCubit>(context).getSlot();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotCubit, SlotState>(
      builder: (context, state) {
        if (state is SlotLoaded) {
          final slotsForSelectedDay = state.patientEntryModal
              .where((slot) => isSameDay(slot.finalDate, _selectedDay))
              .toList();
          return AlertDialog(
            title: const Text('Choose date'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 0.60.sh, // Adjust the height as needed
                  width: 0.5.sw, // Adjust the width as needed
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2020, 10, 16),
                    lastDay: DateTime.utc(DateTime.now().year + 10, 3, 14),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    eventLoader: (day) {
                      return state.patientEntryModal
                          .where((slot) => isSameDay(slot.finalDate, day))
                          .toList();
                    },
                  ),
                ),
                if (slotsForSelectedDay.length < 15 &&
                    _selectedDay.isAfter(DateTime.now()))
                  const Text('SLOT AVAILABLE'),
                if (slotsForSelectedDay.length >= 15 &&
                    !_selectedDay.isAfter(DateTime.now()))
                  const Text('SLOT UNAVAILABLE'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              TextButton(
                child: const Text('Redate Entry'),
                onPressed: () {
                  if (slotsForSelectedDay.length < 15 &&
                      _selectedDay.isAfter(DateTime.now())) {
                    Navigator.of(context).pop(); // Close the dialog
                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    BlocProvider.of<RedateCubit>(context)
                        .redateReq(widget.id, formatter.format(_selectedDay));
                  }
                },
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
