import 'package:mymall/model/product.dart';

abstract class ProductLocalRepository {
  Future<List<ProductData>> getAllProducts();

  Future createProduct(ProductData data);

  Future updateProduct(ProductData data);

  Future<int> deleteProductById(int id);

  //We are not going to use this in the demo
  Future<int> deleteAllProduct();
}
