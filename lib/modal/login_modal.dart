// class LoginModal {
//   String? accessToken;
//   Account? account;
//   User? user;
//
//   LoginModal({this.accessToken, this.account, this.user});
//
//   LoginModal.fromJson(Map<String, dynamic> json) {
//     accessToken = json['access_token'];
//     account =
//     json['account'] != null ? new Account.fromJson(json['account']) : null;
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['access_token'] = this.accessToken;
//     if (this.account != null) {
//       data['account'] = this.account!.toJson();
//     }
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }
//
// class Account {
//   List<int>? accountHasRoles;
//   Null? accountAboveId;
//   int? accountBelongsToUser;
//   int? blocked;
//   String? createDate;
//   int? deleted;
//   Null? deletedBy;
//   String? deletedDate;
//   int? id;
//   Null? parentAccount;
//   String? password;
//   List<Null>? patientAccount;
//   int? status;
//   List<Null>? subAccounts;
//   int? userId;
//   String? username;
//   Null? verifiedBy;
//   String? verifiedDate;
//   int? wrongAttempt;
//
//   Account(
//       {this.accountHasRoles,
//         this.accountAboveId,
//         this.accountBelongsToUser,
//         this.blocked,
//         this.createDate,
//         this.deleted,
//         this.deletedBy,
//         this.deletedDate,
//         this.id,
//         this.parentAccount,
//         this.password,
//         this.patientAccount,
//         this.status,
//         this.subAccounts,
//         this.userId,
//         this.username,
//         this.verifiedBy,
//         this.verifiedDate,
//         this.wrongAttempt});
//
//   Account.fromJson(Map<String, dynamic> json) {
//     accountHasRoles = json['AccountHasRoles'].cast<int>();
//     accountAboveId = json['accountAbove_id'];
//     accountBelongsToUser = json['accountBelongsToUser'];
//     blocked = json['blocked'];
//     createDate = json['create_date'];
//     deleted = json['deleted'];
//     deletedBy = json['deleted_by'];
//     deletedDate = json['deleted_date'];
//     id = json['id'];
//     parentAccount = json['parent_account'];
//     password = json['password'];
//     if (json['patientAccount'] != null) {
//       patientAccount = <Null>[];
//       json['patientAccount'].forEach((v) {
//         patientAccount!.add(new Null.fromJson(v));
//       });
//     }
//     status = json['status'];
//     if (json['sub_accounts'] != null) {
//       subAccounts = <Null>[];
//       json['sub_accounts'].forEach((v) {
//         subAccounts!.add(new Null.fromJson(v));
//       });
//     }
//     userId = json['user_id'];
//     username = json['username'];
//     verifiedBy = json['verified_by'];
//     verifiedDate = json['verified_date'];
//     wrongAttempt = json['wrongAttempt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['AccountHasRoles'] = this.accountHasRoles;
//     data['accountAbove_id'] = this.accountAboveId;
//     data['accountBelongsToUser'] = this.accountBelongsToUser;
//     data['blocked'] = this.blocked;
//     data['create_date'] = this.createDate;
//     data['deleted'] = this.deleted;
//     data['deleted_by'] = this.deletedBy;
//     data['deleted_date'] = this.deletedDate;
//     data['id'] = this.id;
//     data['parent_account'] = this.parentAccount;
//     data['password'] = this.password;
//     if (this.patientAccount != null) {
//       data['patientAccount'] =
//           this.patientAccount!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     if (this.subAccounts != null) {
//       data['sub_accounts'] = this.subAccounts!.map((v) => v.toJson()).toList();
//     }
//     data['user_id'] = this.userId;
//     data['username'] = this.username;
//     data['verified_by'] = this.verifiedBy;
//     data['verified_date'] = this.verifiedDate;
//     data['wrongAttempt'] = this.wrongAttempt;
//     return data;
//   }
// }
//
// class User {
//   List<Null>? userAdviceBys;
//   List<Null>? usercabins;
//   int? cadreId;
//   String? createDate;
//   int? deleted;
//   Null? deletedBy;
//   String? deletedDate;
//   int? departmentId;
//   int? designationId;
//   String? email;
//   Null? email2;
//   Null? email3;
//   String? employeeId;
//   String? firstname;
//   int? id;
//   String? lastname;
//   String? middlename;
//   String? mobile;
//   Null? mobile2;
//   Null? mobile3;
//   Null? officeAddress;
//   Null? officeAddressId;
//   int? status;
//   Null? unitId;
//   List<UserAccount>? userAccount;
//   List<Null>? userBlock;
//   UserCadre? userCadre;
//   List<Null>? userCentre;
//   UserDepartment? userDepartment;
//   UserDesignation? userDesignation;
//   List<Null>? userHeadOfBlock;
//   List<Null>? userHeadOfCentre;
//   List<Null>? userHeadOfDepartment;
//   List<Null>? userHeadOfUnit;
//   Null? userUnit;
//   Null? verifiedBy;
//   String? verifiedDate;
//
//   User(
//       {this.userAdviceBys,
//         this.usercabins,
//         this.cadreId,
//         this.createDate,
//         this.deleted,
//         this.deletedBy,
//         this.deletedDate,
//         this.departmentId,
//         this.designationId,
//         this.email,
//         this.email2,
//         this.email3,
//         this.employeeId,
//         this.firstname,
//         this.id,
//         this.lastname,
//         this.middlename,
//         this.mobile,
//         this.mobile2,
//         this.mobile3,
//         this.officeAddress,
//         this.officeAddressId,
//         this.status,
//         this.unitId,
//         this.userAccount,
//         this.userBlock,
//         this.userCadre,
//         this.userCentre,
//         this.userDepartment,
//         this.userDesignation,
//         this.userHeadOfBlock,
//         this.userHeadOfCentre,
//         this.userHeadOfDepartment,
//         this.userHeadOfUnit,
//         this.userUnit,
//         this.verifiedBy,
//         this.verifiedDate});
//
//   User.fromJson(Map<String, dynamic> json) {
//     if (json['UserAdviceBys'] != null) {
//       userAdviceBys = <Null>[];
//       json['UserAdviceBys'].forEach((v) {
//         userAdviceBys!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['Usercabins'] != null) {
//       usercabins = <Null>[];
//       json['Usercabins'].forEach((v) {
//         usercabins!.add(new Null.fromJson(v));
//       });
//     }
//     cadreId = json['cadre_id'];
//     createDate = json['create_date'];
//     deleted = json['deleted'];
//     deletedBy = json['deleted_by'];
//     deletedDate = json['deleted_date'];
//     departmentId = json['department_id'];
//     designationId = json['designation_id'];
//     email = json['email'];
//     email2 = json['email2'];
//     email3 = json['email3'];
//     employeeId = json['employee_id'];
//     firstname = json['firstname'];
//     id = json['id'];
//     lastname = json['lastname'];
//     middlename = json['middlename'];
//     mobile = json['mobile'];
//     mobile2 = json['mobile2'];
//     mobile3 = json['mobile3'];
//     officeAddress = json['officeAddress'];
//     officeAddressId = json['officeAddress_id'];
//     status = json['status'];
//     unitId = json['unit_id'];
//     if (json['userAccount'] != null) {
//       userAccount = <UserAccount>[];
//       json['userAccount'].forEach((v) {
//         userAccount!.add(new UserAccount.fromJson(v));
//       });
//     }
//     if (json['userBlock'] != null) {
//       userBlock = <Null>[];
//       json['userBlock'].forEach((v) {
//         userBlock!.add(new Null.fromJson(v));
//       });
//     }
//     userCadre = json['userCadre'] != null
//         ? new UserCadre.fromJson(json['userCadre'])
//         : null;
//     if (json['userCentre'] != null) {
//       userCentre = <Null>[];
//       json['userCentre'].forEach((v) {
//         userCentre!.add(new Null.fromJson(v));
//       });
//     }
//     userDepartment = json['userDepartment'] != null
//         ? new UserDepartment.fromJson(json['userDepartment'])
//         : null;
//     userDesignation = json['userDesignation'] != null
//         ? new UserDesignation.fromJson(json['userDesignation'])
//         : null;
//     if (json['userHeadOfBlock'] != null) {
//       userHeadOfBlock = <Null>[];
//       json['userHeadOfBlock'].forEach((v) {
//         userHeadOfBlock!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['userHeadOfCentre'] != null) {
//       userHeadOfCentre = <Null>[];
//       json['userHeadOfCentre'].forEach((v) {
//         userHeadOfCentre!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['userHeadOfDepartment'] != null) {
//       userHeadOfDepartment = <Null>[];
//       json['userHeadOfDepartment'].forEach((v) {
//         userHeadOfDepartment!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['userHeadOfUnit'] != null) {
//       userHeadOfUnit = <Null>[];
//       json['userHeadOfUnit'].forEach((v) {
//         userHeadOfUnit!.add(new Null.fromJson(v));
//       });
//     }
//     userUnit = json['userUnit'];
//     verifiedBy = json['verified_by'];
//     verifiedDate = json['verified_date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.userAdviceBys != null) {
//       data['UserAdviceBys'] =
//           this.userAdviceBys!.map((v) => v.toJson()).toList();
//     }
//     if (this.usercabins != null) {
//       data['Usercabins'] = this.usercabins!.map((v) => v.toJson()).toList();
//     }
//     data['cadre_id'] = this.cadreId;
//     data['create_date'] = this.createDate;
//     data['deleted'] = this.deleted;
//     data['deleted_by'] = this.deletedBy;
//     data['deleted_date'] = this.deletedDate;
//     data['department_id'] = this.departmentId;
//     data['designation_id'] = this.designationId;
//     data['email'] = this.email;
//     data['email2'] = this.email2;
//     data['email3'] = this.email3;
//     data['employee_id'] = this.employeeId;
//     data['firstname'] = this.firstname;
//     data['id'] = this.id;
//     data['lastname'] = this.lastname;
//     data['middlename'] = this.middlename;
//     data['mobile'] = this.mobile;
//     data['mobile2'] = this.mobile2;
//     data['mobile3'] = this.mobile3;
//     data['officeAddress'] = this.officeAddress;
//     data['officeAddress_id'] = this.officeAddressId;
//     data['status'] = this.status;
//     data['unit_id'] = this.unitId;
//     if (this.userAccount != null) {
//       data['userAccount'] = this.userAccount!.map((v) => v.toJson()).toList();
//     }
//     if (this.userBlock != null) {
//       data['userBlock'] = this.userBlock!.map((v) => v.toJson()).toList();
//     }
//     if (this.userCadre != null) {
//       data['userCadre'] = this.userCadre!.toJson();
//     }
//     if (this.userCentre != null) {
//       data['userCentre'] = this.userCentre!.map((v) => v.toJson()).toList();
//     }
//     if (this.userDepartment != null) {
//       data['userDepartment'] = this.userDepartment!.toJson();
//     }
//     if (this.userDesignation != null) {
//       data['userDesignation'] = this.userDesignation!.toJson();
//     }
//     if (this.userHeadOfBlock != null) {
//       data['userHeadOfBlock'] =
//           this.userHeadOfBlock!.map((v) => v.toJson()).toList();
//     }
//     if (this.userHeadOfCentre != null) {
//       data['userHeadOfCentre'] =
//           this.userHeadOfCentre!.map((v) => v.toJson()).toList();
//     }
//     if (this.userHeadOfDepartment != null) {
//       data['userHeadOfDepartment'] =
//           this.userHeadOfDepartment!.map((v) => v.toJson()).toList();
//     }
//     if (this.userHeadOfUnit != null) {
//       data['userHeadOfUnit'] =
//           this.userHeadOfUnit!.map((v) => v.toJson()).toList();
//     }
//     data['userUnit'] = this.userUnit;
//     data['verified_by'] = this.verifiedBy;
//     data['verified_date'] = this.verifiedDate;
//     return data;
//   }
// }
//
// class UserCadre {
//   List<int>? cadreDesignations;
//   List<int>? cadreUsers;
//   int? deleted;
//   Null? deletedBy;
//   String? deletedDate;
//   int? id;
//   String? name;
//
//   UserCadre(
//       {this.cadreDesignations,
//         this.cadreUsers,
//         this.deleted,
//         this.deletedBy,
//         this.deletedDate,
//         this.id,
//         this.name});
//
//   UserCadre.fromJson(Map<String, dynamic> json) {
//     cadreDesignations = json['cadreDesignations'].cast<int>();
//     cadreUsers = json['cadreUsers'].cast<int>();
//     deleted = json['deleted'];
//     deletedBy = json['deleted_by'];
//     deletedDate = json['deleted_date'];
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cadreDesignations'] = this.cadreDesignations;
//     data['cadreUsers'] = this.cadreUsers;
//     data['deleted'] = this.deleted;
//     data['deleted_by'] = this.deletedBy;
//     data['deleted_date'] = this.deletedDate;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class UserDepartment {
//   String? abbr;
//   int? deleted;
//   Null? deletedBy;
//   String? deletedDate;
//   List<Null>? departmentBlocks;
//   List<Null>? departmentCentres;
//   List<Null>? departmentHead;
//   List<int>? departmentUnits;
//   List<int>? departmentUsers;
//   int? id;
//   String? name;
//   String? type;
//
//   UserDepartment(
//       {this.abbr,
//         this.deleted,
//         this.deletedBy,
//         this.deletedDate,
//         this.departmentBlocks,
//         this.departmentCentres,
//         this.departmentHead,
//         this.departmentUnits,
//         this.departmentUsers,
//         this.id,
//         this.name,
//         this.type});
//
//   UserDepartment.fromJson(Map<String, dynamic> json) {
//     abbr = json['abbr'];
//     deleted = json['deleted'];
//     deletedBy = json['deleted_by'];
//     deletedDate = json['deleted_date'];
//     if (json['departmentBlocks'] != null) {
//       departmentBlocks = <Null>[];
//       json['departmentBlocks'].forEach((v) {
//         departmentBlocks!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['departmentCentres'] != null) {
//       departmentCentres = <Null>[];
//       json['departmentCentres'].forEach((v) {
//         departmentCentres!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['departmentHead'] != null) {
//       departmentHead = <Null>[];
//       json['departmentHead'].forEach((v) {
//         departmentHead!.add(new Null.fromJson(v));
//       });
//     }
//     departmentUnits = json['departmentUnits'].cast<int>();
//     departmentUsers = json['departmentUsers'].cast<int>();
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['abbr'] = this.abbr;
//     data['deleted'] = this.deleted;
//     data['deleted_by'] = this.deletedBy;
//     data['deleted_date'] = this.deletedDate;
//     if (this.departmentBlocks != null) {
//       data['departmentBlocks'] =
//           this.departmentBlocks!.map((v) => v.toJson()).toList();
//     }
//     if (this.departmentCentres != null) {
//       data['departmentCentres'] =
//           this.departmentCentres!.map((v) => v.toJson()).toList();
//     }
//     if (this.departmentHead != null) {
//       data['departmentHead'] =
//           this.departmentHead!.map((v) => v.toJson()).toList();
//     }
//     data['departmentUnits'] = this.departmentUnits;
//     data['departmentUsers'] = this.departmentUsers;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     return data;
//   }
// }
//
// class UserDesignation {
//   String? abbr;
//   int? cadre;
//   int? cadreId;
//   int? deleted;
//   Null? deletedBy;
//   String? deletedDate;
//   List<int>? designationUsers;
//   int? id;
//   String? name;
//
//   UserDesignation(
//       {this.abbr,
//         this.cadre,
//         this.cadreId,
//         this.deleted,
//         this.deletedBy,
//         this.deletedDate,
//         this.designationUsers,
//         this.id,
//         this.name});
//
//   UserDesignation.fromJson(Map<String, dynamic> json) {
//     abbr = json['abbr'];
//     cadre = json['cadre'];
//     cadreId = json['cadre_id'];
//     deleted = json['deleted'];
//     deletedBy = json['deleted_by'];
//     deletedDate = json['deleted_date'];
//     designationUsers = json['designationUsers'].cast<int>();
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['abbr'] = this.abbr;
//     data['cadre'] = this.cadre;
//     data['cadre_id'] = this.cadreId;
//     data['deleted'] = this.deleted;
//     data['deleted_by'] = this.deletedBy;
//     data['deleted_date'] = this.deletedDate;
//     data['designationUsers'] = this.designationUsers;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
