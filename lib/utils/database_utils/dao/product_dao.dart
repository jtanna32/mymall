import 'dart:async';

import 'package:mymall/model/product.dart';
import 'package:mymall/utils/database_utils/database_helper.dart';

class ProductDao {
  final dbProvider = DatabaseHelper.dbHelper;

  //Adds new Product records
  Future<int> createProduct(ProductData data) async {
    final db = await dbProvider.database;
    var result = db.insert(productTable, data.toJson());
    return result;
  }

  //Get All Product items
  //Searches if query string was passed
  Future<List<ProductData>> getProduct(
      {List<String>? columns, String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(productTable,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(productTable, columns: columns);
    }

    List<ProductData> products = result!.isNotEmpty
        ? result.map((item) => ProductData.fromJson(item)).toList()
        : [];
    return products;
  }

  //Update Product record
  Future<int> updateProduct(ProductData data) async {
    final db = await dbProvider.database;

    var result = await db.update(productTable, data.toJson(),
        where: "id = ?", whereArgs: [data.id]);

    return result;
  }

  //Delete Product records
  Future<int> deleteProduct(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(productTable, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future<int> deleteAllProduct() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      productTable,
    );

    return result;
  }
}
