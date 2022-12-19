import 'dart:async';

import 'package:mymall/model/pet.dart';
import 'package:mymall/utils/database_utils/database_helper.dart';

class PetDao {
  final dbProvider = DatabaseHelper.dbHelper;

  //Adds new pet records
  Future<int> createPet(PetData data) async {
    final db = await dbProvider.database;
    var result = db.insert(petTable, data.toJson());
    return result;
  }

  //Get All pet items
  //Searches if query string was passed
  Future<List<PetData>> getPet(
      {List<String>? columns, String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(petTable,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(petTable, columns: columns);
    }

    List<PetData> pets = result!.isNotEmpty
        ? result.map((item) => PetData.fromJson(item)).toList()
        : [];
    return pets;
  }

  //Update pet record
  Future<int> updatePet(PetData data) async {
    final db = await dbProvider.database;

    var result = await db.update(petTable, data.toJson(),
        where: "id = ?", whereArgs: [data.id]);

    return result;
  }

  //Delete pet records
  Future<int> deletePet(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(petTable, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future<int> deleteAllPet() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      petTable,
    );

    return result;
  }
}
