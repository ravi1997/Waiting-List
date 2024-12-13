import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import 'cadre_modal.dart';

class DesignationModal {
  int? id;
  String name;
  CadreModal? cadre;
  List<RegistrationUserModal>? designationUsers;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  DesignationModal({
    this.id,
    required this.name,
    this.cadre,
    this.designationUsers,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory DesignationModal.fromJson(Map<String, dynamic> json) =>
      DesignationModal(
        id: json['id'],
        name: json['name'],
        // cadre:
        //     json['cadre'] == null ? null : CadreModal.fromJson(json['cadre']),
        // designationUsers: json['designationUsers'] == null
        //     ? null
        //     : List<UserModal>.from(
        //         json['designationUsers'].map((x) => UserModal.fromJson(x))),
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] == null
        //     ? null
        //     : DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cadre': cadre?.toJson(),
        'designationUsers': designationUsers == null
            ? null
            : List<dynamic>.from(designationUsers!.map((x) => x.toJson())),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<DesignationModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DesignationModal.fromJson(json)).toList();
  }
}
