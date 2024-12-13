class BuildingModal {
  int id;
  String name;

  BuildingModal({
    required this.id,
    required this.name,
  });

  factory BuildingModal.fromJson(Map<String, dynamic> json) => BuildingModal(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  static List<BuildingModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BuildingModal.fromJson(json)).toList();
  }
}
