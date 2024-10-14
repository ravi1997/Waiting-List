import 'designation_modal.dart';

class CadreModal {
  int id;
  String name;
  List<DesignationModal>? cadreDesignations;
  // int? deleted;
  // DateTime? deletedDate;
  // int? deletedBy;

  CadreModal({
    required this.id,
    required this.name,
    // required this.cadreDesignations,
    // required this.deleted,
    // required this.deletedDate,
    // required this.deletedBy,
  });

  factory CadreModal.fromJson(Map<String, dynamic> json) => CadreModal(
        id: json['id'],
        name: json['name'],
        // cadreDesignations: json['cadreDesignations'],
        // deleted: json['deleted'],
        // deletedDate: DateTime.parse(json['deleted_date']),
        // deletedBy: json['deleted_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // 'cadreDesignations': cadreDesignations?.map((x) => x.toJson()).toList(),
        // 'deleted': deleted,
        // 'deleted_date': deletedDate?.toIso8601String(),
        // 'deleted_by': deletedBy,
      };

  static List<CadreModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CadreModal.fromJson(json)).toList();
  }
}
