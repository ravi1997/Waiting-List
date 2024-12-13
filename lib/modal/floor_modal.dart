class FloorModal {
  int? id;
  int? number;

  FloorModal({this.id, this.number});

  factory FloorModal.fromJson(Map<String, dynamic> json) => FloorModal(
        id: json['id'],
        number: json['number'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
      };

  static List<FloorModal> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FloorModal.fromJson(json)).toList();
  }
}
