import 'package:e_commerce_app/src/common/widgets/card_widget.dart';
import 'package:e_commerce_app/src/common/widgets/search_widgets.dart';
import 'package:e_commerce_app/src/common/widgets/yellow_cards.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_bloc.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_event.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsState();
}

class _ProductsState extends State<ProductsWidget> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("products"),
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: 100,
            decoration: BoxDecoration(color: Colors.yellow[600]),
            child: const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Explore,collect,play!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                Text(
                  "From Pokemon to Magic to Star Wars!",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: SearchWidgets(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: PromotionCards(),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 10),
                    itemCount: state.productData.length,
                    itemBuilder: (context, index) {
                      final dataItems = state.productData[index];
                      final title = dataItems.title;
                      final price = dataItems.price.toString();
                      // final brand = dataItems.brand;
                      final thumbnail = dataItems.thumbnail;
                      return CardWidget(
                          title: title,
                          price: price,
                          // brand: brand,
                          thumbnail: thumbnail);
                    },
                  ),
                );
              }
              return const Center(child: Text("No product available."));
            },
          ),
        ],
      ),
    );
  }
}
