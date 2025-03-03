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
import 'package:project/ui/Screens/Product/product.dart';
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

  final _emptyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeServices())..fetchHome(),
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: const Color(0xFF3347C4),
          child: const Icon(Icons.shopping_cart, color: Colors.white, size: 25),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavBar(
          currentIndex: 0,
        ),
        appBar: AppBarWidget(
          isDisabled: true,
          controller: _emptyController,
          onTapFunction: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlocProvider(
                create: (_) => SearchCubit(SearchServices()),
                child: SearchScreen(),
              );
            }));
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
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5,
                      crossAxisCount: MediaQuery.sizeOf(context).width ~/ 180,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        rate: state.products[index].rate,
                                        image: state.products[index].image,
                                        title: state.products[index].title,
                                        description:
                                            state.products[index].description,
                                        price: state.products[index].price,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom:10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.2),
                              color: Color.fromARGB(255, 246, 245, 245),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                        right: 0,
                                        top: 0,
                                        child: IconButton(
                                            onPressed: () {},
                                            iconSize: 18.sp,
                                            style: ButtonStyle(
                                                minimumSize:
                                                    WidgetStatePropertyAll(
                                                        Size(10, 10)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8))),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.grey[300]),
                                                shadowColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.black),
                                                elevation:
                                                    WidgetStatePropertyAll(5)),
                                            icon: Icon(Icons.favorite_border))),
                                    Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: IconButton(
                                            onPressed: () {},
                                            iconSize: 18.sp,
                                            style: ButtonStyle(
                                                minimumSize:
                                                    WidgetStatePropertyAll(
                                                        Size(10, 10)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8))),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.grey[300]),
                                                shadowColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.black),
                                                elevation:
                                                    WidgetStatePropertyAll(5)),
                                            icon:
                                                Icon(Icons.add_shopping_cart_sharp))),
                                    Positioned(
                                        left: 6,
                                        bottom: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              Text(
                                                state.products[index].rate
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                              SizedBox(width: 2),
                                              Icon(
                                                Icons.star_outlined,
                                                size: 16.sp,
                                                color: Color(0xFFf3ac30),
                                              ),
                                              SizedBox(width: 3),
                                              Text(state.products[index].reviews.length.toString(), style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),)
                                            ],
                                          ),
                                        )),
                                    Center(
                                      child: Image.network(
                                        state.products[index].image,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.products[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
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
                                            '${state.products[index].stock} In Stock',
                                        secondsText: 'Free Delivery'),
                                  ],
                                ),
                              )
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
