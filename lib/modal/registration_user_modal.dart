class RegistrationUserModal {
  String? message;
  User? user;

  RegistrationUserModal({this.message, this.user});

  RegistrationUserModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? cadreId;
  int? createdBy;
  String? createdDate;
  int? deleted;
  Null? deletedBy;
  String? deletedDate;
  int? departmentId;
  int? designationId;
  String? email;
  Null? email2;
  Null? email3;
  String? employeeId;
  String? firstname;
  int? id;
  String? lastname;
  String? middlename;
  String? mobile;
  Null? mobile2;
  Null? mobile3;
  int? officeAddressId;
  int? status;
  int? unitId;
  int? updatedBy;
  String? updatedDate;
  Null? verifiedBy;
  String? verifiedDate;

  User(
      {this.cadreId,
      this.createdBy,
      this.createdDate,
      this.deleted,
      this.deletedBy,
      this.deletedDate,
      this.departmentId,
      this.designationId,
      this.email,
      this.email2,
      this.email3,
      this.employeeId,
      this.firstname,
      this.id,
      this.lastname,
      this.middlename,
      this.mobile,
      this.mobile2,
      this.mobile3,
      this.officeAddressId,
      this.status,
      this.unitId,
      this.updatedBy,
      this.updatedDate,
      this.verifiedBy,
      this.verifiedDate});

  User.fromJson(Map<String, dynamic> json) {
    cadreId = json['cadre_id'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    deleted = json['deleted'];
    deletedBy = json['deleted_by'];
    deletedDate = json['deleted_date'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    email = json['email'];
    email2 = json['email2'];
    email3 = json['email3'];
    employeeId = json['employee_id'];
    firstname = json['firstname'];
    id = json['id'];
    lastname = json['lastname'];
    middlename = json['middlename'];
    mobile = json['mobile'];
    mobile2 = json['mobile2'];
    mobile3 = json['mobile3'];
    officeAddressId = json['officeAddress_id'];
    status = json['status'];
    unitId = json['unit_id'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    verifiedBy = json['verified_by'];
    verifiedDate = json['verified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cadre_id'] = this.cadreId;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['deleted'] = this.deleted;
    data['deleted_by'] = this.deletedBy;
    data['deleted_date'] = this.deletedDate;
    data['department_id'] = this.departmentId;
    data['designation_id'] = this.designationId;
    data['email'] = this.email;
    data['email2'] = this.email2;
    data['email3'] = this.email3;
    data['employee_id'] = this.employeeId;
    data['firstname'] = this.firstname;
    data['id'] = this.id;
    data['lastname'] = this.lastname;
    data['middlename'] = this.middlename;
    data['mobile'] = this.mobile;
    data['mobile2'] = this.mobile2;
    data['mobile3'] = this.mobile3;
    data['officeAddress_id'] = this.officeAddressId;
    data['status'] = this.status;
    data['unit_id'] = this.unitId;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    data['verified_by'] = this.verifiedBy;
    data['verified_date'] = this.verifiedDate;
    return data;
  }
}
