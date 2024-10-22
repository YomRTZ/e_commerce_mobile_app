import 'package:e_commerce_app/src/bussiness/product_repository.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_event.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc({required this.productRepository})
      : super(ProductInitialState()) {
    on<GetProductEvent>(
      (event, emit) async {
        emit(ProductLoadingState());
        try {
          final response = await productRepository.getProduct();
          if (response.isNotEmpty) {
            emit(ProductSuccessState(response));
          } else {
            emit(ProductErrorState("product not found"));
          }
        } catch (error) {
          emit(ProductErrorState("error ${error.toString()}"));
        }
      },
    );
  }
}
