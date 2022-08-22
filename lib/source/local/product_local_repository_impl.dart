import 'package:mymall/utils/database_utils/dao/product_dao.dart';
import 'package:mymall/model/product.dart';
import 'package:mymall/source/local/product_local_repository.dart';

class ProductLocalRepositoryImpl extends ProductLocalRepository {
  final productDao = ProductDao();

  Future<List<ProductData>> getAllProducts() => productDao.getProduct();

  Future<int> createProduct(ProductData data) => productDao.createProduct(data);

  Future updateProduct(ProductData data) => productDao.updateProduct(data);

  Future<int> deleteProductById(int id) => productDao.deleteProduct(id);

  //We are not going to use this in the demo
  Future<int> deleteAllProduct() => productDao.deleteAllProduct();
}
