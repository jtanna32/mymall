import 'package:mymall/model/pet.dart';

abstract class PetLocalRepository {
  Future<List<PetData>> getAllPets();

  Future createPet(PetData data);

  Future updatePet(PetData data);

  Future<int> deletePetById(int id);

  Future<int> deleteAllPet();
}
