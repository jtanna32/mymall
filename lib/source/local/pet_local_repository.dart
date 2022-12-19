import 'package:hive/hive.dart';
import 'package:mymall/model/pet_model.dart';

abstract class PetLocalRepository {
  Future<Box<PetModel>> getAllPets();

  Future createPet(PetModel data);
}
