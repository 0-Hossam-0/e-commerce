import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Categories/logic/categories_cubit.dart';
import 'package:project/data/Categories/repository/api.dart';
import 'package:project/data/Search/logic/search_cubit.dart';
import 'package:project/data/Search/repository/api.dart';
import 'package:project/ui/Public_Widgets/app_bar.dart';
import 'package:project/ui/Screens/Home/Widgets/text_animation.dart';
import 'package:project/ui/Screens/Search/search.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  CategoryScreen({super.key, required this.category});
  final _emptyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(CategoriesServices())..fetchCategories(category),
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBarWidget(
          isDisabled: true,
          controller: _emptyController,
          onTapFunction: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return BlocProvider(
                create: (_) => SearchCubit(SearchServices()),
                child: SearchScreen(),
              );
            }));
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: MediaQuery.sizeOf(context).width ~/ 180,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.categories.length,
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
                                  state.categories[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              state.categories[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              '\$${state.categories[index].price}',
                              style: TextStyle(
                                  color: Color(0xFF3347C4),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(height: 10),
                            AnimateText(
                                firstText:
                                    '${state.categories[index].count} In Stock',
                                secondsText: 'Free Delivery'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
