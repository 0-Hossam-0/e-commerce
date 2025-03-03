import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/ui/Screens/Home/home.dart';
import 'package:project/ui/Screens/Landing/splash.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/Cart/cart_hive.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('cartItems');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
