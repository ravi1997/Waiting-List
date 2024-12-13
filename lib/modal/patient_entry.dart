import 'package:rpc_waiting_list/modal/patient_demographic.dart';

class PatientEntry {
  final String adviceBy;
  final String anesthesia;
  final String cabin;
  final String diagnosis;
  final String eua;
  final String eye;
  final DateTime finalDate;
  final int id;
  final DateTime initialDate;
  final PatientDemographic patientDemographic;
  final String plan;
  final String priority;
  final String? remark;
  final String short;
  final String ptSurgery;
  final int userId;

  PatientEntry({
    required this.adviceBy,
    required this.anesthesia,
    required this.cabin,
    required this.diagnosis,
    required this.eua,
    required this.eye,
    required this.finalDate,
    required this.id,
    required this.initialDate,
    required this.patientDemographic,
    required this.plan,
    required this.priority,
    this.remark,
    required this.short,
    required this.userId,
    required this.ptSurgery,

  });

  factory PatientEntry.fromJson(Map<String, dynamic> json) {
    return PatientEntry(
      adviceBy: json['adviceBy'] as String,
      anesthesia: json['anesthesia'] as String,
      cabin: json['cabin'] as String,
      diagnosis: json['diagnosis'] as String,
      eua: json['eua'] as String,
      eye: json['eye'] as String,
      finalDate: DateTime.parse(json['finalDate'] as String),
      id: json['id'] as int,
      initialDate: DateTime.parse(json['initialDate'] as String),
      patientDemographic: PatientDemographic.fromJson(
          json['patientDemographic'] as Map<String, dynamic>),
      plan: json['plan'] as String,
      priority: json['priority'] as String,
      remark: json['remark'] as String?,
      short: json['short'] as String,
      userId: json['user_id'] as int,
      ptSurgery:json['ptSurgery'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adviceBy': adviceBy,
      'anesthesia': anesthesia,
      'cabin': cabin,
      'diagnosis': diagnosis,
      'eua': eua,
      'eye': eye,
      'finalDate': finalDate.toIso8601String(),
      'id': id,
      'initialDate': initialDate.toIso8601String(),
      'patientDemographic': patientDemographic.toJson(),
      'plan': plan,
      'priority': priority,
      'remark': remark,
      'short': short,
      'user_id': userId,
      'ptSurgery':ptSurgery
    };
  }

  static List<PatientEntry> fromJsonList(List<dynamic> jsonList) {
    // print(jsonList.length);
    return jsonList.map((json) => PatientEntry.fromJson(json)).toList();
  }
}
