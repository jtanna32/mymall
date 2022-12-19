import 'package:mymall/model/pet.dart';
import 'package:mymall/source/local/pet_local_repository.dart';
import 'package:mymall/utils/database_utils/dao/pet_dao.dart';

class PetLocalRepositoryImpl extends PetLocalRepository {
  final petDao = PetDao();

  Future<List<PetData>> getAllPets() => petDao.getPet();

  Future<int> createPet(PetData data) => petDao.createPet(data);

  Future updatePet(PetData data) => petDao.updatePet(data);

  Future<int> deletePetById(int id) => petDao.deletePet(id);

  //We are not going to use this in the demo
  Future<int> deleteAllPet() => petDao.deleteAllPet();
}
