import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Categories/logic/categories_cubit.dart';
import 'package:project/data/Categories/repository/api.dart';
import 'package:project/data/Home/repository/api.dart';
import 'package:project/data/Product/logic/product_cubit.dart';
import 'package:project/ui/Screens/Categories/categories.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatefulWidget {
  final String imageAsset;
  final String category;
  const CategoryCard({
    super.key,
    required this.imageAsset,
    required this.category,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}


class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    String categoryName;
    void _navigateCategory() {
      if (widget.category == 'Man Clothing') {
        categoryName = "men's%20clothing";
      } else if (widget.category == 'Electronics') {
        categoryName = "electronics";
      } else if (widget.category == 'Jewelery') {
        categoryName = "jewelery";
      } else {
        categoryName = "women's clothing";
      }

      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return MultiBlocProvider(
      //     providers: [
      //       BlocProvider<CategoriesCubit>(
      //         create: (_) => CategoriesCubit(CategoriesServices()),
      //       ),
      //       BlocProvider<ProductCubit>(create: (_) => ProductCubit(Produ())),
      //     ],
      //     child: CategoryScreen(category: categoryName),
      //   );
      // }));
    }

    return GestureDetector(
      onTap: _navigateCategory,
      child: Container(
        width: 60.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(widget.imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
          padding: EdgeInsets.all(12),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
