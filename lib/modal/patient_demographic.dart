class PatientDemographic {
  final int id;
  final String fname;
  final String mname;
  final String lname;
  final DateTime dob;
  final String gender;
  final String phoneNo;
  final String? phoneNo1;
  final String uhid;

  PatientDemographic({
    required this.id,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.dob,
    required this.gender,
    required this.phoneNo,
    this.phoneNo1,
    required this.uhid,
  });

  factory PatientDemographic.fromJson(Map<String, dynamic> json) {
    return PatientDemographic(
      id: json['id'],
      fname: json['fname'],
      mname: json['mname'],
      lname: json['lname'],
      dob: DateTime.parse(json['dob']),
      gender: json['gender'],
      phoneNo: json['phoneNo'],
      phoneNo1: json['phoneNo1'],
      uhid: json['uhid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'fname': fname,
      'mname': mname,
      'lname': lname,
      'dob': dob.toIso8601String(),
      'gender': gender,
      'phoneNo': phoneNo,
      'phoneNo1': phoneNo1,
      'uhid': uhid,
    };
  }

  @override
  String toString() {
    return "PatientDemographic(fname: '$fname', lname: '$lname', uhid: '$uhid')";
  }
}
