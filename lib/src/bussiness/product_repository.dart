import 'package:e_commerce_app/src/data/model/product_model.dart';
import 'package:e_commerce_app/src/service/data_provider/product_provider.dart';

class ProductRepository {
  ProductProvider productProvider;
  ProductRepository({required this.productProvider});
  Future<List<Product>> getProduct() async {
    return await productProvider.fetchProduct();
  }
}
