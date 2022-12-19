// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfectionAdapter extends TypeAdapter<Infection> {
  @override
  final int typeId = 2;

  @override
  Infection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Infection(
      treatment: fields[0] as String?,
      infection: fields[1] as String?,
      lastVisitDate: fields[2] as String?,
      recurringDays: fields[3] as String?,
      isRecurring: fields[4] as bool?,
      doctorDetails: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Infection obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.treatment)
      ..writeByte(1)
      ..write(obj.infection)
      ..writeByte(2)
      ..write(obj.lastVisitDate)
      ..writeByte(3)
      ..write(obj.recurringDays)
      ..writeByte(4)
      ..write(obj.isRecurring)
      ..writeByte(5)
      ..write(obj.doctorDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
