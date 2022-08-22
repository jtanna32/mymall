import 'package:mymall/model/product.dart';

abstract class ProductRepository {
   Future<Product> getProducts(int page);
}