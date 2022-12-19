// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PetModelAdapter extends TypeAdapter<PetModel> {
  @override
  final int typeId = 0;

  @override
  PetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PetModel(
      uid: fields[0] as String?,
      name: fields[1] as String?,
      breed: fields[2] as String?,
      species: fields[3] as String?,
      sex: fields[4] as String?,
      weight: fields[5] as String?,
      dob: fields[6] as String?,
      birthmark: fields[7] as String?,
      nature: fields[8] as String?,
      lastPregnancy: fields[9] as String?,
      sterilization: fields[10] as String?,
      medicalContact: fields[11] as MedicalContact?,
      dogImages: (fields[12] as List?)?.cast<String>(),
      birthmarkImage: fields[13] as String?,
      pictureWithOwner: fields[14] as String?,
      ownerUid: fields[15] as String?,
      ownerName: fields[16] as String?,
      ownerAddress: fields[17] as String?,
      ownerContact: fields[18] as String?,
      ownerAltContact: fields[19] as String?,
      latitude: fields[20] as String?,
      longitude: fields[21] as String?,
      treatment: (fields[22] as List?)?.cast<Infection>(),
      allergies: (fields[23] as List?)?.cast<Infection>(),
    );
  }

  @override
  void write(BinaryWriter writer, PetModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.breed)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.sex)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.dob)
      ..writeByte(7)
      ..write(obj.birthmark)
      ..writeByte(8)
      ..write(obj.nature)
      ..writeByte(9)
      ..write(obj.lastPregnancy)
      ..writeByte(10)
      ..write(obj.sterilization)
      ..writeByte(11)
      ..write(obj.medicalContact)
      ..writeByte(12)
      ..write(obj.dogImages)
      ..writeByte(13)
      ..write(obj.birthmarkImage)
      ..writeByte(14)
      ..write(obj.pictureWithOwner)
      ..writeByte(15)
      ..write(obj.ownerUid)
      ..writeByte(16)
      ..write(obj.ownerName)
      ..writeByte(17)
      ..write(obj.ownerAddress)
      ..writeByte(18)
      ..write(obj.ownerContact)
      ..writeByte(19)
      ..write(obj.ownerAltContact)
      ..writeByte(20)
      ..write(obj.latitude)
      ..writeByte(21)
      ..write(obj.longitude)
      ..writeByte(22)
      ..write(obj.treatment)
      ..writeByte(23)
      ..write(obj.allergies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
