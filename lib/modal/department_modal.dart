import 'package:rpc_waiting_list/modal/unit_modal.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import 'block_modal.dart';
import 'center_modal.dart';

class DepartmentModal {
  int id;
  String name;
  String? abbr;
  String? type;
  List<BlockModal>? departmentBlocks;
  List<CentreModal>? departmentCentres;
  List<UnitModal>? departmentUnits;
  List<RegistrationUserModal>? departmentUsers;
  List<RegistrationUserModal>? departmentHead;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  DepartmentModal({
    required this.id,
    required this.name,
    this.abbr,
    this.type,
    this.departmentBlocks,
    this.departmentCentres,
    this.departmentUnits,
    this.departmentUsers,
    this.departmentHead,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory DepartmentModal.fromJson(Map<String, dynamic> json) =>
      DepartmentModal(
        id: json['id'],
        name: json['name'],
        // abbr: json['abbr'],
        // type: json['type'],
        // departmentBlocks: json['departmentBlocks'] == null
        //     ? null
        //     : List<BlockModal>.from(
        //         json['departmentBlocks'].map((x) => BlockModal.fromJson(x))),
        // departmentCentres: json['departmentCentres'] == null
        //     ? null
        //     : List<CentreModal>.from(
        //         json['departmentCentres'].map((x) => CentreModal.fromJson(x))),
        // departmentUnits: json['departmentUnits'] == null
        //     ? null
        //     : List<UnitModal>.from(
        //         json['departmentUnits'].map((x) => UnitModal.fromJson(x))),
        // departmentUsers: json['departmentUsers'] == null
        //     ? null
        //     : List<UserModal>.from(
        //         json['departmentUsers'].map((x) => UserModal.fromJson(x))),
        // departmentHead: json['departmentHead'] == null
        //     ? null
        //     : List<UserModal>.from(
        //         json['departmentHead'].map((x) => UserModal.fromJson(x))),
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
        'type': type,
        'departmentBlocks': departmentBlocks == null
            ? null
            : List<dynamic>.from(departmentBlocks!.map((x) => x.toJson())),
        'departmentCentres': departmentCentres == null
            ? null
            : List<dynamic>.from(departmentCentres!.map((x) => x.toJson())),
        'departmentUnits': departmentUnits == null
            ? null
            : List<dynamic>.from(departmentUnits!.map((x) => x.toJson())),
        'departmentUsers': departmentUsers == null
            ? null
            : List<dynamic>.from(departmentUsers!.map((x) => x.toJson())),
        'departmentHead': departmentHead == null
            ? null
            : List<dynamic>.from(departmentHead!.map((x) => x.toJson())),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<DepartmentModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DepartmentModal.fromJson(json)).toList();
  }
}
