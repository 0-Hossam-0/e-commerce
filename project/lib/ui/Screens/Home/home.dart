import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Home/logic/products_cubit.dart';
import 'package:project/data/Home/repository/api.dart';
import 'package:project/data/Search/logic/search_cubit.dart';
import 'package:project/data/Search/repository/api.dart';
import 'package:project/ui/Public_Widgets/app_bar.dart';
import 'package:project/ui/Public_Widgets/navbar.dart';
import 'package:project/ui/Public_Widgets/product_skeleton.dart';
import 'package:project/ui/Screens/Cart/cart.dart';
import 'package:project/ui/Screens/Home/Widgets/category.dart';
import 'package:project/ui/Screens/Home/Widgets/text_animation.dart';
import 'package:project/ui/Screens/Search/search.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = const [
    'Man Clothing',
    'Woman Clothing',
    'Electronics',
    'Jewelery'
  ];
  final List<String> imageAssets = const [
    'assets/images/man-category.jpg',
    'assets/images/women-category.jpg',
    'assets/images/electronics-category.jpg',
    'assets/images/jewellery-category.jpg',
  ];

  HomeScreen({super.key});

  @override
  final _emptyController = TextEditingController();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(HomeServices())..fetchProducts(),
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: const Color(0xFF3347C4),
          child: const Icon(Icons.shopping_cart, color: Colors.white, size: 25),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavBar(),
        appBar: AppBarWidget(
          isDisabled: true,
          controller: _emptyController,
          onTapFunction: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BlocProvider(
                create: (_) => SearchCubit(SearchServices()),
                child: SearchScreen(),
              );
            }
            ));
          },
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (index) {
                        return Row(
                          children: [
                            SizedBox(width: 30),
                            CategoryCard(
                                imageAsset: imageAssets[index],
                                category: categories[index]),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<ProductsCubit, HomeState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: MediaQuery.sizeOf(context).width ~/ 180,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.network(
                                    state.products[index].image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                state.products[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Text(
                                '\$${state.products[index].price}',
                                style: TextStyle(
                                    color: Color(0xFF3347C4),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(height: 10),
                              AnimateText(
                                  firstText:
                                      '${state.products[index].count} In Stock',
                                  secondsText: 'Free Delivery'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return ProductSkeleton();
              },
            ),
          ),
        ),
      ),
    );
  }
}
