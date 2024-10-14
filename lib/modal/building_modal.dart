import 'block_modal.dart';
import 'center_modal.dart';
import 'floor_modal.dart';

class BuildingModal {
  int id;
  String name;
  // String? abbr;
  // List<FloorModal>? buildingFloors;
  // CentreModal? buildingCentre;
  // BlockModal? buildingBlock;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  BuildingModal({
    required this.id,
    required this.name,
    // required this.abbr,
    // required this.buildingFloors,
    // required this.buildingCentre,
    // required this.buildingBlock,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory BuildingModal.fromJson(Map<String, dynamic> json) => BuildingModal(
        id: json['id'],
        name: json['name'],
        // abbr: json['abbr'],
        // buildingFloors: json['buildingFloors'] != null
        //     ? List<FloorModal>.from(
        //         json['buildingFloors'].map((x) => FloorModal.fromJson(x)))
        //     : null,
        // buildingCentre: json['buildingCentre'] != null
        //     ? CentreModal.fromJson(json['buildingCentre'])
        //     : null,
        // buildingBlock: json['buildingBlock'] != null
        //     ? BlockModal.fromJson(json['buildingBlock'])
        //     : null,
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] != null
        //     ? DateTime.parse(json['deleted_date'])
        //     : null,
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // 'abbr': abbr,
        // 'buildingFloors': buildingFloors?.map((x) => x.toJson()).toList(),
        // 'buildingCentre': buildingCentre?.toJson(),
        // 'buildingBlock': buildingBlock?.toJson(),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<BuildingModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BuildingModal.fromJson(json)).toList();
  }
}
