class BlockModal {
  int id;
  String name;
  String? abbr;
  String? type;
  // final int? deleted;
  // final DateTime? deletedDate;
  // final int? deletedBy;

  BlockModal({
    required this.id,
    required this.name,
    this.abbr,
    required this.type,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory BlockModal.fromJson(Map<String, dynamic> json) {
    return BlockModal(
      id: json['id'],
      name: json['name'],
      abbr: json['abbr'],
      type: json['type'],
      // deleted: json['deleted'],
      // deletedDate: json['deletedDate'] != null
      //     ? DateTime.parse(json['deletedDate'])
      //     : null,
      // deletedBy: json['deletedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'abbr': abbr,
      'type': type,
      // 'deleted': deleted,
      // 'deletedDate': deletedDate?.toIso8601String(),
      // 'deletedBy': deletedBy,
    };
  }
}
