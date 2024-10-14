import 'floor_modal.dart';

class OtModal {
  int id;
  String name;
  String? abbr;
  int? tables;
  FloorModal? otBuildingFloor;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  OtModal({
    required this.id,
    required this.name,
    this.abbr,
    this.tables,
    this.otBuildingFloor,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory OtModal.fromJson(Map<String, dynamic> json) => OtModal(
        id: json['id'],
        name: json['name'],
        abbr: json['abbr'],
        tables: json['tables'],
        otBuildingFloor: json['otBuildingFloor'] == null
            ? null
            : FloorModal.fromJson(json['otBuildingFloor']),
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
        'tables': tables,
        'otBuildingFloor': otBuildingFloor?.toJson(),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };
}
