import 'package:dio/dio.dart';
import 'package:mymall/model/product.dart';
import 'package:mymall/source/remote/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Product> getProducts(int page) async{
    // get products api to get product list
    var result = await Dio().post("http://205.134.254.135/~mobile/MtProject/public/api/product_list.php", data: {
      "page": page,
      "perPage": 5
    }, options: Options(headers: {
      "token": "eyJhdWQiOiI1IiwianRpIjoiMDg4MmFiYjlmNGU1MjIyY2MyNjc4Y2FiYTQwOGY2MjU4Yzk5YTllN2ZkYzI0NWQ4NDMxMTQ4ZWMz"
    }));
    print("got result ${result.data}");
    if(result == null) {
      // throw exception if result is null
      throw Exception();
    } else {
      return productFromJson(result.data);
    }
  }
}