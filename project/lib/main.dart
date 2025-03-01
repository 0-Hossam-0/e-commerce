import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:project/data/Cart/cart_hive.dart';
import 'package:project/data/Categories/logic/categories_cubit.dart';
import 'package:project/data/Categories/repository/api.dart';
import 'package:project/data/Home/logic/home_cubit.dart';
import 'package:project/data/Home/repository/api.dart';
import 'package:project/ui/Screens/Cart/cart.dart';
import 'package:sizer/sizer.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductAdapter());
  // await Hive.openBox<Product>('cartItem');

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesCubit>(
            create: (_) => CategoriesCubit(CategoriesServices()),
          ),
          BlocProvider<HomeCubit>(create: (_) => HomeCubit(HomeServices())),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: CartScreen(),
        ),
      ),
    );
  }
}
