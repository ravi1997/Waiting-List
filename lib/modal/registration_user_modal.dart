class RegistrationUserModal {
  String? message;
  User? user;

  RegistrationUserModal({this.message, this.user});

  RegistrationUserModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  final int cadreId;
  final int createdBy;
  final DateTime createdDate;
  final int deleted;
  final int? deletedBy;
  final DateTime? deletedDate;
  final int departmentId;
  final int designationId;
  final String email;
  final String? email2;
  final String? email3;
  final String employeeId;
  final String firstname;
  final int id;
  final String lastname;
  final String? middlename;
  final String mobile;
  final String? mobile2;
  final String? mobile3;
  final int officeAddressId;
  final int? parentId;
  final int parentStatus;
  final int status;
  final int unitId;
  final int updatedBy;
  final DateTime updatedDate;
  final int? verifiedBy;
  final DateTime? verifiedDate;

  User({
    required this.cadreId,
    required this.createdBy,
    required this.createdDate,
    required this.deleted,
    this.deletedBy,
    this.deletedDate,
    required this.departmentId,
    required this.designationId,
    required this.email,
    this.email2,
    this.email3,
    required this.employeeId,
    required this.firstname,
    required this.id,
    required this.lastname,
    this.middlename,
    required this.mobile,
    this.mobile2,
    this.mobile3,
    required this.officeAddressId,
    this.parentId,
    required this.parentStatus,
    required this.status,
    required this.unitId,
    required this.updatedBy,
    required this.updatedDate,
    this.verifiedBy,
    this.verifiedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cadreId: json['cadre_id'] as int,
      createdBy: json['created_by'] as int,
      createdDate: DateTime.parse(json['created_date'] as String),
      deleted: json['deleted'] as int,
      deletedBy: json['deleted_by'] as int?,
      deletedDate: json['deleted_date'] != null
          ? DateTime.parse(json['deleted_date'] as String)
          : null,
      departmentId: json['department_id'] as int,
      designationId: json['designation_id'] as int,
      email: json['email'] as String,
      email2: json['email2'] as String?,
      email3: json['email3'] as String?,
      employeeId: json['employee_id'] as String,
      firstname: json['firstname'] as String,
      id: json['id'] as int,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      mobile: json['mobile'] as String,
      mobile2: json['mobile2'] as String?,
      mobile3: json['mobile3'] as String?,
      officeAddressId: json['officeAddress_id'] as int,
      parentId: json['parent_id'] as int?,
      parentStatus: json['parent_status'] as int,
      status: json['status'] as int,
      unitId: json['unit_id'] as int,
      updatedBy: json['updated_by'] as int,
      updatedDate: DateTime.parse(json['updated_date'] as String),
      verifiedBy: json['verified_by'] as int?,
      verifiedDate: json['verified_date'] != null
          ? DateTime.parse(json['verified_date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cadre_id': cadreId,
      'created_by': createdBy,
      'created_date': createdDate.toIso8601String(),
      'deleted': deleted,
      'deleted_by': deletedBy,
      'deleted_date': deletedDate?.toIso8601String(),
      'department_id': departmentId,
      'designation_id': designationId,
      'email': email,
      'email2': email2,
      'email3': email3,
      'employee_id': employeeId,
      'firstname': firstname,
      'id': id,
      'lastname': lastname,
      'middlename': middlename,
      'mobile': mobile,
      'mobile2': mobile2,
      'mobile3': mobile3,
      'officeAddress_id': officeAddressId,
      'parent_id': parentId,
      'parent_status': parentStatus,
      'status': status,
      'unit_id': unitId,
      'updated_by': updatedBy,
      'updated_date': updatedDate.toIso8601String(),
      'verified_by': verifiedBy,
      'verified_date': verifiedDate?.toIso8601String(),
    };
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
