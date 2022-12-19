// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalContactAdapter extends TypeAdapter<MedicalContact> {
  @override
  final int typeId = 1;

  @override
  MedicalContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicalContact(
      doctorName: fields[0] as String?,
      clinicAddress: fields[1] as String?,
      clinicHours: fields[2] as String?,
      clinicContact: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicalContact obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.doctorName)
      ..writeByte(1)
      ..write(obj.clinicAddress)
      ..writeByte(2)
      ..write(obj.clinicHours)
      ..writeByte(3)
      ..write(obj.clinicContact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
