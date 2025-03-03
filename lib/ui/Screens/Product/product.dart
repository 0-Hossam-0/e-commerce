import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/data/Cart/add_product.dart';
import 'package:project/data/Cart/cart_hive.dart';
import 'package:project/ui/Screens/Cart/cart.dart';
import 'package:project/ui/Screens/Product/Widgets/color.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductScreen extends StatefulWidget {
  final String image;
  final String description;
  final String title;
  final double price;
  final double rate;

  const ProductScreen(
      {super.key,
      required this.image,
      required this.description,
      required this.title,
      required this.price,
      required this.rate});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _counter = 1;
  bool _favourite = false;

  final cardInstans = CartBasket();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 1) {
        _counter--;
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      _favourite = !_favourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(
                              widget.image,
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.only(
                              left: 20,
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 70.w,
                                          child: Text(
                                            widget.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                        Text(
                                          '\$${widget.price}',
                                          style: TextStyle(
                                              color: Color(0xFF3347C4),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.sp),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF7B2),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            widget.rate.toString(),
                                            style: TextStyle(fontSize: 17.sp),
                                          ),
                                          SizedBox(width: 3),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[800],
                                            size: 22.sp,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: Text(
                                    widget.description,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ColorWidget(
                                        color: Color(0xFFFF5151), icon: false),
                                    SizedBox(width: 15.sp),
                                    ColorWidget(
                                        color: Color(0xFF3347C4), icon: false),
                                    SizedBox(width: 15.sp),
                                    ColorWidget(
                                        color: Color(0xFFFF7A00), icon: false),
                                    SizedBox(width: 15.sp),
                                    ColorWidget(
                                        color: Color(0xFFC4C4C4), icon: false),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ColorWidget(
                                      color: Colors.white,
                                      icon: Icons.remove,
                                      onTap: _decrementCounter,
                                    ),
                                    SizedBox(width: 15.sp),
                                    Text(
                                      _counter.toString(),
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 15.sp),
                                    ColorWidget(
                                      color: Colors.white,
                                      icon: Icons.add,
                                      onTap: _incrementCounter,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            iconSize: WidgetStatePropertyAll(22.sp),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 1.8.h)),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFFD2D9FF)),
                          ),
                          icon: Icon(Icons.shopping_cart),
                          color: Color(0xFF3347C4),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()),
                            );
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cardInstans.addProduct(Product(
                                image: widget.image,
                                price: widget.price,
                                title: widget.title,
                                description: widget.description,
                                quantity: 1,
                                selected: false));
                            Fluttertoast.showToast(
                              msg: "Product added to cart",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 1.5.h)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF3347C4)),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Icon(Icons.arrow_back_ios_new_sharp, size: 20.sp),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shadowColor: WidgetStatePropertyAll(Colors.black),
                            elevation: WidgetStatePropertyAll(7),
                          ),
                        ),
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: Icon(
                            _favourite ? Icons.favorite : Icons.favorite_border,
                            size: 20.sp,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shadowColor: WidgetStatePropertyAll(Colors.black),
                            elevation: WidgetStatePropertyAll(7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
