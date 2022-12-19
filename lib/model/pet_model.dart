import 'medical_contact.dart';
import 'infection.dart';
import 'dart:convert';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));
String petModelToJson(PetModel data) => json.encode(data.toJson());
class PetModel {
  PetModel({
      this.uid, 
      this.name, 
      this.breed, 
      this.species, 
      this.sex, 
      this.weight, 
      this.dob, 
      this.birthmark, 
      this.nature, 
      this.lastPregnancy, 
      this.sterilization, 
      this.medicalContact, 
      this.dogImages, 
      this.birthmarkImage, 
      this.pictureWithOwner, 
      this.ownerUid, 
      this.ownerName, 
      this.ownerAddress, 
      this.ownerContact, 
      this.ownerAltContact, 
      this.latitude, 
      this.longitude, 
      this.treatment, 
      this.allergies,});

  PetModel.fromJson(dynamic json) {
    uid = json['uid'];
    name = json['name'];
    breed = json['breed'];
    species = json['species'];
    sex = json['sex'];
    weight = json['weight'];
    dob = json['dob'];
    birthmark = json['birthmark'];
    nature = json['nature'];
    lastPregnancy = json['lastPregnancy'];
    sterilization = json['sterilization'];
    medicalContact = json['medicalContact'] != null ? MedicalContact.fromJson(json['medicalContact']) : null;
    dogImages = json['dogImages'] != null ? json['dogImages'].cast<String>() : [];
    birthmarkImage = json['birthmarkImage'];
    pictureWithOwner = json['pictureWithOwner'];
    ownerUid = json['ownerUid'];
    ownerName = json['ownerName'];
    ownerAddress = json['ownerAddress'];
    ownerContact = json['ownerContact'];
    ownerAltContact = json['ownerAltContact'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['treatment'] != null) {
      treatment = [];
      json['treatment'].forEach((v) {
        treatment?.add(Infection.fromJson(v));
      });
    }
    if (json['allergies'] != null) {
      allergies = [];
      json['allergies'].forEach((v) {
        allergies?.add(Infection.fromJson(v));
      });
    }
  }
  String? uid;
  String? name;
  String? breed;
  String? species;
  String? sex;
  String? weight;
  String? dob;
  String? birthmark;
  String? nature;
  String? lastPregnancy;
  String? sterilization;
  MedicalContact? medicalContact;
  List<String>? dogImages;
  String? birthmarkImage;
  String? pictureWithOwner;
  String? ownerUid;
  String? ownerName;
  String? ownerAddress;
  String? ownerContact;
  String? ownerAltContact;
  String? latitude;
  String? longitude;
  List<Infection>? treatment;
  List<Infection>? allergies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['name'] = name;
    map['breed'] = breed;
    map['species'] = species;
    map['sex'] = sex;
    map['weight'] = weight;
    map['dob'] = dob;
    map['birthmark'] = birthmark;
    map['nature'] = nature;
    map['lastPregnancy'] = lastPregnancy;
    map['sterilization'] = sterilization;
    if (medicalContact != null) {
      map['medicalContact'] = medicalContact?.toJson();
    }
    map['dogImages'] = dogImages;
    map['birthmarkImage'] = birthmarkImage;
    map['pictureWithOwner'] = pictureWithOwner;
    map['ownerUid'] = ownerUid;
    map['ownerName'] = ownerName;
    map['ownerAddress'] = ownerAddress;
    map['ownerContact'] = ownerContact;
    map['ownerAltContact'] = ownerAltContact;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    if (treatment != null) {
      map['treatment'] = treatment?.map((v) => v.toJson()).toList();
    }
    if (allergies != null) {
      map['allergies'] = allergies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}