import 'package:e_commerce_app/src/getIt/get_it.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_bloc.dart';
import 'package:e_commerce_app/src/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getitSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => getIt<ProductBloc>(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ));
  }
}
