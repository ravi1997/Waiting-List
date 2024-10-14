import 'account_modal.dart';

class RoleModal {
  int id;
  String name;
  List<AccountModal>? roleAllocatedToAccounts;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  RoleModal({
    required this.id,
    required this.name,
    this.roleAllocatedToAccounts,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory RoleModal.fromJson(Map<String, dynamic> json) => RoleModal(
        id: json['id'],
        name: json['name'],
        roleAllocatedToAccounts: json['roleAllocatedToAccounts'] == null
            ? null
            : List<AccountModal>.from(json['roleAllocatedToAccounts']
                .map((x) => AccountModal.fromJson(x))),
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] == null
        //     ? null
        //     : DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'roleAllocatedToAccounts': roleAllocatedToAccounts == null
            ? null
            : List<dynamic>.from(
                roleAllocatedToAccounts!.map((x) => x.toJson())),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };
}
