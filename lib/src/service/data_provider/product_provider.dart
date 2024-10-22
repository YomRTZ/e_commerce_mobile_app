import 'dart:convert';

import 'package:e_commerce_app/src/common/url/common_uri.dart';
import 'package:e_commerce_app/src/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  // to get the product
  Future<List<Product>> fetchProduct() async {
    const String url = "${AppUrl.BaseUrl}/product";
    try {
      final response = await http.get(Uri.parse("${AppUrl.BaseUrl}/product"));
      print("url:$url");
      if (response.statusCode == 200) {
        Map<String, dynamic> product = jsonDecode(response.body);
        List<dynamic> productList = product['products'];
        print("data:$productList");
        print("statusCode:${response.statusCode}");

        return productList
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      print("Exception: $error");
      print("Stack trace: $stacktrace");
      rethrow;
    }
  }
}
