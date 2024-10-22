import 'package:e_commerce_app/src/bussiness/product_repository.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_bloc.dart';
import 'package:e_commerce_app/src/service/data_provider/product_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void getitSetUp() {
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider());

  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepository(productProvider: getIt<ProductProvider>()));
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(productRepository: getIt<ProductRepository>()),
  );
}
