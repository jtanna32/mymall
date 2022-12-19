import 'dart:convert';

MedicalContact medicalContactFromJson(String str) => MedicalContact.fromJson(json.decode(str));
String medicalContactToJson(MedicalContact data) => json.encode(data.toJson());
class MedicalContact {
  MedicalContact({
      this.doctorName, 
      this.clinicAddress, 
      this.clinicHours, 
      this.clinicContact,});

  MedicalContact.fromJson(dynamic json) {
    doctorName = json['doctorName'];
    clinicAddress = json['clinicAddress'];
    clinicHours = json['clinicHours'];
    clinicContact = json['clinicContact'];
  }
  String? doctorName;
  String? clinicAddress;
  String? clinicHours;
  String? clinicContact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorName'] = doctorName;
    map['clinicAddress'] = clinicAddress;
    map['clinicHours'] = clinicHours;
    map['clinicContact'] = clinicContact;
    return map;
  }

}