import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mymall/model/pet_model.dart';

class HiveDataStore {
  static const boxName = "petBox";

  // Get reference to an already opened box
  static Box<PetModel> box = Hive.box<PetModel>(boxName);

  /// Add new user
  Future<int> addUser({required PetModel petModel}) async {
    return box.add(petModel);
  }

  /// show user list
  Future<PetModel?> getUser({required String id}) async {
    await box.get(id);
  }

  /// update user data
  Future<void> updateUser(
      {required int index, required PetModel petModel}) async {
    await box.putAt(index, petModel);
  }

  /// delete user
  Future<void> deleteUser({required int index}) async {
    await box.deleteAt(index);
  }
}
