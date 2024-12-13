class Diagnosis {
  final int id;
  final String value;

  Diagnosis({required this.id, required this.value});

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Diagnosis> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Diagnosis.fromJson(json)).toList();
  }
}

class Plan {
  final int id;
  final String value;

  Plan({required this.id, required this.value});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Plan> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Plan.fromJson(json)).toList();
  }
}

class Eye {
  final int id;
  final String value;

  Eye({required this.id, required this.value});

  factory Eye.fromJson(Map<String, dynamic> json) {
    return Eye(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Eye> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Eye.fromJson(json)).toList();
  }
}

class Priority {
  final int id;
  final String value;

  Priority({required this.id, required this.value});

  factory Priority.fromJson(Map<String, dynamic> json) {
    return Priority(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Priority> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Priority.fromJson(json)).toList();
  }
}

class Anesthesia {
  final int id;
  final String value;

  Anesthesia({required this.id, required this.value});

  factory Anesthesia.fromJson(Map<String, dynamic> json) {
    return Anesthesia(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Anesthesia> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Anesthesia.fromJson(json)).toList();
  }
}

class EUA {
  final int id;
  final String value;

  EUA({required this.id, required this.value});

  factory EUA.fromJson(Map<String, dynamic> json) {
    return EUA(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<EUA> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => EUA.fromJson(json)).toList();
  }
}

class Short {
  final int id;
  final String value;

  Short({required this.id, required this.value});

  factory Short.fromJson(Map<String, dynamic> json) {
    return Short(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value};
  }

  static List<Short> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Short.fromJson(json)).toList();
  }
}

class Advice {
  final int adviceById;
  final int anesthesiaId;
  final int cabinId;
  final int? deleted;
  final int diagnosisId;
  final int euaId;
  final int eyeId;
  final DateTime finalDate;
  final int? id;
  final DateTime initialDate;
  final int patientdemographicId;
  final int planId;
  final int priorityId;
  final String? remark;
  final int shortId;
  final int userId;
  final String ptSurgery;

  Advice({
    required this.adviceById,
    required this.anesthesiaId,
    required this.cabinId,
    this.deleted,
    required this.diagnosisId,
    required this.euaId,
    required this.eyeId,
    required this.finalDate,
    this.id,
    required this.initialDate,
    required this.patientdemographicId,
    required this.planId,
    required this.priorityId,
    this.remark,
    required this.shortId,
    required this.userId,
    required this.ptSurgery,
  });

  factory Advice.fromJson(Map<String, dynamic> json) {
    return Advice(
      adviceById: json['adviceBy_id'],
      anesthesiaId: json['anesthesia_id'],
      cabinId: json['cabin_id'],
      deleted: json['deleted'],
      diagnosisId: json['diagnosis_id'],
      euaId: json['eua_id'],
      eyeId: json['eye_id'],
      finalDate: DateTime.parse(json['finalDate']),
      id: json['id'],
      initialDate: DateTime.parse(json['initialDate']),
      patientdemographicId: json['patientdemographic_id'],
      planId: json['plan_id'],
      priorityId: json['priority_id'],
      remark: json['remark'],
      shortId: json['short_id'],
      userId: json['user_id'],
      ptSurgery: json['ptSurgery'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adviceBy_id': adviceById,
      'anesthesia_id': anesthesiaId,
      'cabin_id': cabinId,
      // 'deleted': deleted,
      'diagnosis_id': diagnosisId,
      'eua_id': euaId,
      'eye_id': eyeId,
      'finalDate': finalDate.toIso8601String(),
      // 'id': id,
      'initialDate': initialDate.toIso8601String(),
      'patientdemographic_id': patientdemographicId,
      'plan_id': planId,
      'priority_id': priorityId,
      'remark': remark,
      'short_id': shortId,
      'user_id': userId,
      'ptSurgery':ptSurgery,
    };
  }

  Map<String, dynamic> toJsonwithID() {
    return {
      'adviceBy_id': adviceById,
      'anesthesia_id': anesthesiaId,
      'cabin_id': cabinId,
      // 'deleted': deleted,
      'diagnosis_id': diagnosisId,
      'eua_id': euaId,
      'eye_id': eyeId,
      'finalDate': finalDate.toIso8601String(),
      'id': id,
      'initialDate': initialDate.toIso8601String(),
      'patientdemographic_id': patientdemographicId,
      'plan_id': planId,
      'priority_id': priorityId,
      'remark': remark,
      'short_id': shortId,
      'user_id': userId,
      'ptSurgery':ptSurgery
    };
  }

  static List<Advice> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Advice.fromJson(json)).toList();
  }
}
