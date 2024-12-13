import 'package:flutter/material.dart';
import 'package:rpc_waiting_list/helper/user.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<Widget> _loadContent() async{
    LocalUser localUser = LocalUser();
    User? user = await localUser.getUser();
    if (user == null) {
      return const Text('Something went wrong');
    }

    final name = "${user.firstname} ${user.middlename} ${user.lastname}";

    return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildDetailRow('First Name', name),
              _buildDetailRow('Email', user.email),
              Visibility(
                visible: user.email2 != null,
                child: _buildDetailRow('Secondary Email', user.email2 ?? 'N/A'),
              ),
              Visibility(
                visible: user.email2 != null,
                child: _buildDetailRow('Tertiary Email', user.email3 ?? 'N/A'),
              ),
              _buildDetailRow('Mobile', user.mobile),
              _buildDetailRow('Secondary Mobile', user.mobile2 ?? 'N/A'),
              _buildDetailRow('Tertiary Mobile', user.mobile3 ?? 'N/A'),
              _buildDetailRow('Employee ID', user.employeeId),
              _buildDetailRow('Designation ID', user.designationId.toString()),
              _buildDetailRow('Department ID', user.departmentId.toString()),
              _buildDetailRow('Cadre ID', user.cadreId.toString()),
              _buildDetailRow('Office Address ID', user.officeAddressId.toString()),
              _buildDetailRow('Parent ID', user.parentId?.toString() ?? 'N/A'),
              _buildDetailRow('Parent Status', user.parentStatus.toString()),
              _buildDetailRow('Status', user.status.toString()),
              _buildDetailRow('Created By', user.createdBy.toString()),
              _buildDetailRow('Created Date', user.createdDate.toString()),
              _buildDetailRow('Updated By', user.updatedBy.toString()),
              _buildDetailRow('Updated Date', user.updatedDate.toString()),
              _buildDetailRow('Verified By', user.verifiedBy?.toString() ?? 'N/A'),
              _buildDetailRow(
                  'Verified Date', user.verifiedDate?.toString() ?? 'N/A'),
              _buildDetailRow('Deleted', user.deleted == 1 ? 'Yes' : 'No'),
              _buildDetailRow('Deleted By', user.deletedBy?.toString() ?? 'N/A'),
              _buildDetailRow(
                  'Deleted Date', user.deletedDate?.toString() ?? 'N/A'),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context)  {
    return FutureBuilder<Widget>(
      future: _loadContent(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading spinner
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Handle errors
        } else if (snapshot.hasData) {
          return snapshot.data!; // Return the widget when data is ready
        } else {
          return Text('No data available'); // Handle the case of no data
        }
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }
}
