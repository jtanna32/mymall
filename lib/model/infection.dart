import 'dart:convert';

Infection infectionFromJson(String str) => Infection.fromJson(json.decode(str));
String infectionToJson(Infection data) => json.encode(data.toJson());
class Infection {
  Infection({
      this.treatment,
      this.infection,
      this.lastVisitDate,
      this.recurringDays,
      this.isRecurring,
      this.doctorDetails,});

  Infection.fromJson(dynamic json) {
    treatment = json['treatment'];
    infection = json['infection'];
    lastVisitDate = json['lastVisitDate'];
    recurringDays = json['recurringDays'];
    isRecurring = json['isRecurring'];
    doctorDetails = json['doctorDetails'];
  }
  String? treatment;
  String? infection;
  String? lastVisitDate;
  String? recurringDays;
  bool? isRecurring;
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