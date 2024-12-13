class Account {
  final int createdBy;
  final DateTime createdDate;
  final int deleted;
  final int? deletedBy;
  final DateTime? deletedDate;
  final int id;
  final String password;
  final int status;
  final int updatedBy;
  final DateTime updatedDate;
  final int userId;
  final String username;
  final int verifiedBy;
  final DateTime verifiedDate;
  final int wrongAttempt;

  Account({
    required this.createdBy,
    required this.createdDate,
    required this.deleted,
    this.deletedBy,
    this.deletedDate,
    required this.id,
    required this.password,
    required this.status,
    required this.updatedBy,
    required this.updatedDate,
    required this.userId,
    required this.username,
    required this.verifiedBy,
    required this.verifiedDate,
    required this.wrongAttempt,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      createdBy: json['created_by'] as int,
      createdDate: DateTime.parse(json['created_date'] as String),
      deleted: json['deleted'] as int,
      deletedBy: json['deleted_by'] as int?,
      deletedDate: json['deleted_date'] != null
          ? DateTime.parse(json['deleted_date'] as String)
          : null,
      id: json['id'] as int,
      password: json['password'] as String,
      status: json['status'] as int,
      updatedBy: json['updated_by'] as int,
      updatedDate: DateTime.parse(json['updated_date'] as String),
      userId: json['user_id'] as int,
      username: json['username'] as String,
      verifiedBy: json['verified_by'] as int,
      verifiedDate: DateTime.parse(json['verified_date'] as String),
      wrongAttempt: json['wrongAttempt'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_by': createdBy,
      'created_date': createdDate.toIso8601String(),
      'deleted': deleted,
      'deleted_by': deletedBy,
      'deleted_date': deletedDate?.toIso8601String(),
      'id': id,
      'password': password,
      'status': status,
      'updated_by': updatedBy,
      'updated_date': updatedDate.toIso8601String(),
      'user_id': userId,
      'username': username,
      'verified_by': verifiedBy,
      'verified_date': verifiedDate.toIso8601String(),
      'wrongAttempt': wrongAttempt,
    };
  }
}
