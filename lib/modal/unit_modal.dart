import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import 'department_modal.dart';

class UnitModal {
  int id;
  String name;
  String? abbr;
  DepartmentModal? unitDepartment;
  List<RegistrationUserModal>? unitUsers;
  List<RegistrationUserModal>? unitHead;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  UnitModal({
    required this.id,
    required this.name,
    this.abbr,
    this.unitDepartment,
    this.unitUsers,
    this.unitHead,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory UnitModal.fromJson(Map<String, dynamic> json) => UnitModal(
        id: json['id'],
        name: json['name'],
        // abbr: json['abbr'],
        // unitDepartment: json['unitDepartment'] == null
        //     ? null
        //     : DepartmentModal.fromJson(json['unitDepartment']),
        // unitUsers: json['unitUsers'] == null
        //     ? null
        //     : List<UserModal>.from(
        //         json['unitUsers'].map((x) => UserModal.fromJson(x))),
        // unitHead: json['unitHead'] == null
        //     ? null
        //     : List<UserModal>.from(
        //         json['unitHead'].map((x) => UserModal.fromJson(x))),
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] == null
        //     ? null
        //     : DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abbr': abbr,
        'unitDepartment': unitDepartment?.toJson(),
        'unitUsers': unitUsers == null
            ? null
            : List<dynamic>.from(unitUsers!.map((x) => x.toJson())),
        'unitHead': unitHead == null
            ? null
            : List<dynamic>.from(unitHead!.map((x) => x.toJson())),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<UnitModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UnitModal.fromJson(json)).toList();
  }
}
