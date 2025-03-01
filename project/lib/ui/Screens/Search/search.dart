import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Home/logic/products_cubit.dart';
import 'package:project/data/Home/repository/api.dart';
import 'package:project/data/Search/logic/search_cubit.dart';
import 'package:project/data/Search/repository/api.dart';
import 'package:project/ui/Public_Widgets/app_bar.dart';
import 'package:project/ui/Public_Widgets/product_skeleton.dart';
import 'package:project/ui/Screens/Home/Widgets/text_animation.dart';
import 'package:project/ui/Screens/Home/home.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(SearchServices())..fetchSearch(_searchController.text),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BlocProvider(
                create: (_) => ProductsCubit(HomeServices()),
                child: HomeScreen(),
              );
            }));
          },
          backgroundColor: Color.fromARGB(255, 234, 233, 233),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF3347C4),
          ),
        ),
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBarWidget(
            isDisabled: false, controller: _searchController, isOnChange: true),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
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
    );
  }
}
