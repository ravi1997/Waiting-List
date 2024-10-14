import 'package:rpc_waiting_list/modal/room_modal.dart';

import 'building_modal.dart';
import 'ot_modal.dart';

class FloorModal {
  int? id;
  int? number;

  // String name;
  // String? abbr;
  // BuildingModal? building;
  // List<RoomModal>? floorRooms;
  // List<OtModal>? floorOTs;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  FloorModal({this.id, this.number
      // required this.name,
      // this.abbr,
      // this.building,
      // this.floorRooms,
      // this.floorOTs,
      // this.deleted,
      // this.deletedDate,
      // this.deletedBy,
      });

  factory FloorModal.fromJson(Map<String, dynamic> json) => FloorModal(
        id: json['id'],
        number: json['number'],
        // name: json['name'],
        // abbr: json['abbr'],
        // building: json['building'] == null
        //     ? null
        //     : BuildingModal.fromJson(json['building']),
        // floorRooms: json['floorRooms'] == null
        //     ? null
        //     : List<RoomModal>.from(
        //         json['floorRooms'].map((x) => RoomModal.fromJson(x))),
        // floorOTs: json['floorOTs'] == null
        //     ? null
        //     : List<OtModal>.from(
        //         json['floorOTs'].map((x) => OtModal.fromJson(x))),
        // deleted: json['deleted'],
        // deletedDate: json['deleted_date'] == null
        //     ? null
        //     : DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        // 'name': name,
        // 'abbr': abbr,
        // 'building': building?.toJson(),
        // 'floorRooms': floorRooms == null
        //     ? null
        //     : List<dynamic>.from(floorRooms!.map((x) => x.toJson())),
        // 'floorOTs': floorOTs == null
        //     ? null
        //     : List<dynamic>.from(floorOTs!.map((x) => x.toJson())),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<FloorModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FloorModal.fromJson(json)).toList();
  }
}
