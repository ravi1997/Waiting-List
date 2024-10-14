import 'package:rpc_waiting_list/modal/role_modal.dart';
import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

class AccountModal {
  // int? id;
  String username;
  String password;
  // int? verifiedBy;
  // DateTime? verifiedDate;
  DateTime? createDate;
  int? status;
  RegistrationUserModal? accountBelongsToUser;
  List<RoleModal> accountHasRoles;
  // int? blocked;
  // int? wrongAttempt;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;
  AccountModal? parentAccount;
  List<AccountModal>? subAccounts;

  AccountModal({
    // required this.id,
    required this.username,
    required this.password,
    // required this.verifiedBy,
    // required this.verifiedDate,
    required this.createDate,
    required this.status,
    required this.accountBelongsToUser,
    required this.accountHasRoles,
    // required this.blocked,
    // required this.wrongAttempt,
    // required this.deleted,
    // required this.deletedDate,
    // required this.deletedBy,
    required this.parentAccount,
    required this.subAccounts,
  });

  factory AccountModal.fromJson(Map<String, dynamic> json) => AccountModal(
        // id: json['id'],
        username: json['username'],
        password: json['password'],
        // verifiedBy: json['verified_by'],
        // verifiedDate: json['verified_date'] != null
        //     ? DateTime.parse(json['verified_date'])
        //     : null,
        createDate: json['create_date'] != null
            ? DateTime.parse(json['create_date'])
            : null,
        status: json['status'],
        accountBelongsToUser: json['accountBelongsToUser'] != null
            ? RegistrationUserModal.fromJson(json['accountBelongsToUser'])
            : null,
        accountHasRoles: json['accountHasRoles'],
        // blocked: json['blocked'],
        // wrongAttempt: json['wrongAttempt'],
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] != null
        //     ? DateTime.parse(json['deleted_date'])
        //     : null,
        // deletedBy: json['deleted_by'],
        parentAccount: json['parentAccount'] != null
            ? AccountModal.fromJson(json['parentAccount'])
            : null,
        subAccounts: json['subAccounts'] != null
            ? List<AccountModal>.from(
                json['subAccounts'].map((x) => AccountModal.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'username': username,
        'password': password,
        // 'verified_by': verifiedBy,
        // 'verified_date': verifiedDate?.toIso8601String(),
        'create_date': createDate?.toIso8601String(),
        'status': status,
        'accountBelongsToUser': accountBelongsToUser?.toJson(),
        'accountHasRoles': accountHasRoles?.map((x) => x.toJson()).toList(),
        // 'blocked': blocked,
        // 'wrongAttempt': wrongAttempt,
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
        'parentAccount': parentAccount?.toJson(),
        'subAccounts': subAccounts?.map((x) => x.toJson()).toList(),
      };
}
