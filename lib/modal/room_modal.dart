import 'package:rpc_waiting_list/modal/registration_user_modal.dart';

import 'floor_modal.dart';

class RoomModal {
  int id;
  int number;
  String? name;
  String? abbr;
  FloorModal? buildingFloor;
  RegistrationUserModal? roomUser;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  RoomModal({
    required this.id,
    required this.number,
    this.name,
    this.abbr,
    this.buildingFloor,
    this.roomUser,
    // this.deleted,
    // this.deletedDate,
    // this.deletedBy,
  });

  factory RoomModal.fromJson(Map<String, dynamic> json) => RoomModal(
        id: json['id'],
        number: json['number'],
        // name: json['name'],
        // abbr: json['abbr'],
        // buildingFloor: json['buildingFloor'] == null
        //     ? null
        //     : FloorModal.fromJson(json['buildingFloor']),
        // roomUser: json['roomUser'] == null
        //     ? null
        //     : RegistrationUserModal.fromJson(json['roomUser']),
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] == null
        //     ? null
        //     : DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'name': name,
        'abbr': abbr,
        'buildingFloor': buildingFloor?.toJson(),
        'roomUser': roomUser?.toJson(),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<RoomModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RoomModal.fromJson(json)).toList();
  }
}
