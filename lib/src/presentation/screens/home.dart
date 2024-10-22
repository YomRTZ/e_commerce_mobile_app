import 'package:e_commerce_app/src/common/widgets/circular_widget.dart';
import 'package:e_commerce_app/src/common/widgets/promotion_cards.dart';
import 'package:e_commerce_app/src/common/widgets/scrollebl_button_container_custom_widget.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_bloc.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_event.dart';
import 'package:e_commerce_app/src/presentation/blocs/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> items = [
    {'texts': 'Selling', 'icons': Icons.tag},
    {'texts': 'Deals', 'icons': Icons.flash_auto},
    {'texts': 'Category', 'icons': Icons.category},
    {'texts': 'Saved', 'icons': Icons.favorite}
  ];
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Map<String, dynamic> uniqueCategories = {};
    return Scaffold(
      // logo section
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/logo-search-grid-2x.png'))),
                  ),
                  const Icon(
                    Icons.shopping_cart,
                    size: 24,
                  )
                ],
              ),
              const SizedBox(height: 20),
              //search
              TextField(
                // controller:searchController ,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search...",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    suffixIcon: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.camera))
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //buttons
              SizedBox(
                height: 60,
                child: GridView.custom(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.35,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final item = items[index];
                      return CircularScrolleblWidget(
                        icons: item['icons'],
                        texts: item['texts'],
                      );
                    },
                    childCount: items.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Trending on Yome",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: screenWidth,
                height: 350,
                child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductSuccessState) {
                    for (var product in state.productData) {
                      String category = product.category.name;
                      String image = product.thumbnail;
                      if (!uniqueCategories.containsKey(category)) {
                        uniqueCategories[category] = image;
                      }
                    }
                    List<Map<String, dynamic>> categoryList = uniqueCategories
                        .entries
                        .map((entry) => {entry.key: entry.value})
                        .toList();
                    print("$categoryList");
                    return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          final categoryMap = categoryList[index];
                          final categoryName = categoryMap.keys.first;
                          final imageUrl = categoryMap.values.first;
                          print("uniqu Category:$categoryName");
                          return Container(
                            margin: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                            child: CircularWidget(
                              categoryName: categoryName,
                              imageUrl: imageUrl,
                            ),
                          );
                        });
                  }
                  return const Center(child: Text("No product available."));
                }),
              ),
              const promotionCards(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
