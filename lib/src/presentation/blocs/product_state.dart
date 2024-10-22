import 'package:e_commerce_app/src/data/model/product_model.dart';

class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
 final  List<Product> productData;
  ProductSuccessState(this.productData);
}

class ProductErrorState extends ProductState {
  final String messages;
  ProductErrorState(this.messages);
}
