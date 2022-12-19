import 'dart:convert';

import 'package:hive/hive.dart';

part 'medical_contact.g.dart';

MedicalContact medicalContactFromJson(String str) => MedicalContact.fromJson(json.decode(str));
String medicalContactToJson(MedicalContact data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class MedicalContact extends HiveObject{
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

@HiveField(0)
  String? doctorName;

  @HiveField(1)
  String? clinicAddress;

  @HiveField(2)
  String? clinicHours;

  @HiveField(3)
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