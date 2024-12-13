import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpc_waiting_list/cubit/child_cubit/child_cubit.dart';
import 'package:rpc_waiting_list/cubit/designation_cubit/designation_cubit.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({super.key});

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChildCubit>(context).getChild();
    BlocProvider.of<DesignationCubit>(context).getAllDesignations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChildCubit, ChildState>(
      listener: (context, state) {
        if (state is ChildLoaded) {
          if (state.query == 2) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Information'),
                  content:
                      const Text('Child User has been verified successfully'),
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
        }
      },
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                BlocBuilder<ChildCubit, ChildState>(builder: (context, state) {
              if (state is ChildLoaded) {
                final users = state.userModal.toList();
                return BlocBuilder<DesignationCubit, DesignationState>(
                    builder: (context, state) {
                  if (state is DesignationLoaded) {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text('S.No')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Designation')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: List.generate(users.length, (index) {
                        final user = users[index];
                        final designation =
                            state.designationModal.where((designation) {
                          return designation.id == user.designationId;
                        }).toList();
                        // final DateFormat formatter = DateFormat('dd-MM-yyyy');
                        return DataRow(cells: [
                          DataCell(Text('${index + 1}')), // Display index + 1
                          DataCell(Text(
                              '${user.firstname} ${user.middlename} ${user.lastname}')),
                          DataCell(Text(designation[0].name)),
                          DataCell(Row(
                            children: [
                              BlocListener<ChildCubit, ChildState>(
                                listener: (context, state) {
                                  if (state is ChildLoaded) {
                                    BlocProvider.of<ChildCubit>(context)
                                        .getChild();
                                    setState(() {});
                                  }
                                },
                                child: IconButton(
                                  icon: const Icon(Icons.verified_user),
                                  color: Colors.black,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text('Confirm Child User'),
                                          content: const Text(
                                              'Are you sure you want to verify the child user?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Yes'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                                BlocProvider.of<ChildCubit>(
                                                        context)
                                                    .verifyChild(user.id);
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
                    );
                  }
                  return const Text('Something went wrong');
                });
              }
              return const Text('Something went wrong');
            }),
          ),
        ),
      ),
    );
  }
}
