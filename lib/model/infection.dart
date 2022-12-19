import 'dart:convert';

import 'package:hive/hive.dart';

part 'infection.g.dart';

Infection infectionFromJson(String str) => Infection.fromJson(json.decode(str));
String infectionToJson(Infection data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class Infection extends HiveObject{
  Infection({
    this.treatment,
    this.infection,
    this.lastVisitDate,
    this.recurringDays,
    this.isRecurring,
    this.doctorDetails,
  });

  Infection.fromJson(dynamic json) {
    treatment = json['treatment'];
    infection = json['infection'];
    lastVisitDate = json['lastVisitDate'];
    recurringDays = json['recurringDays'];
    isRecurring = json['isRecurring'];
    doctorDetails = json['doctorDetails'];
  }

  @HiveField(0)
  String? treatment;
  @HiveField(1)
  String? infection;
  @HiveField(2)
  String? lastVisitDate;
  @HiveField(3)
  String? recurringDays;
  @HiveField(4)
  bool? isRecurring;
  @HiveField(5)
  String? doctorDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['treatment'] = treatment;
    map['infection'] = infection;
    map['lastVisitDate'] = lastVisitDate;
    map['recurringDays'] = recurringDays;
    map['isRecurring'] = isRecurring;
    map['doctorDetails'] = doctorDetails;
    return map;
  }
}
