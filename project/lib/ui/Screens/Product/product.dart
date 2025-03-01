import 'package:flutter/material.dart';
import 'package:project/ui/Screens/Product/Widgets/color.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _counter = 1;
  bool _favourite = false;
  void _incrementCounter (){
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter (){
    setState(() {
      if (_counter != 1) {
      _counter--;
      }
    });
  }
    void _toggleFavorite () {
      setState(() {
        _favourite = !_favourite;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf4f4f4),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_new_sharp, size: 20.sp),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shadowColor: WidgetStatePropertyAll(Colors.black),
                            elevation: WidgetStatePropertyAll(7)),
                      ),
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon( _favourite ? Icons.favorite : Icons.favorite_border, size: 20.sp),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shadowColor: WidgetStatePropertyAll(Colors.black),
                            elevation: WidgetStatePropertyAll(7)),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/man-category.jpg',
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 20,
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
                                  Text(
                                    'Product Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.sp),
                                  ),
                                  Text(
                                    '\$100',
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
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '4.5',
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
                              'Wireless controller for PS4, an electronic device specially designed for playing video games.',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
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
                                  color: Colors.white, icon: Icons.remove, onTap: _decrementCounter,),
                              SizedBox(width: 15.sp),
                              Text(
                                _counter.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 15.sp),
                              ColorWidget(
                                  color: Colors.white, icon: Icons.add, onTap: _incrementCounter),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
                                  WidgetStatePropertyAll(Color(0xFFD2D9FF))),
                          icon: Icon(Icons.shopping_cart),
                          color: Color(0xFF3347C4),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 1.5.h)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xFF3347C4))),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
                            )),
                            SizedBox(height:100),
                      ],
                    ))),
          ],
        ));
  }
}



// Stack(
//                 children: [
//                   Positioned(
//                     top: 20,
//                     right: 20,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.favorite_border, size: 20.sp),
//                       style: ButtonStyle(
//                           backgroundColor: WidgetStatePropertyAll(Colors.white),
//                           shadowColor: WidgetStatePropertyAll(Colors.black),
//                           elevation: WidgetStatePropertyAll(7)),
//                     ),
//                   ),
//                   Positioned(
//                     top: 20,
//                     left: 20,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.arrow_back_ios_new_sharp, size: 20.sp),
//                       style: ButtonStyle(
//                           backgroundColor: WidgetStatePropertyAll(Colors.white),
//                           shadowColor: WidgetStatePropertyAll(Colors.black),
//                           elevation: WidgetStatePropertyAll(7)),
//                     ),
//                   ),
//                 ],
//               )


//  Container(
//         width: double.infinity,
//           padding: EdgeInsets.symmetric(vertical: 30),
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 style: ButtonStyle(
//                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                     iconSize: WidgetStatePropertyAll(22.sp),
//                     padding: WidgetStatePropertyAll(
//                         EdgeInsets.symmetric(horizontal: 34, vertical: 18)),
//                     backgroundColor:
//                         WidgetStatePropertyAll(Color(0xFFD2D9FF))),
//                 icon: Icon(Icons.shopping_cart),
//                 color: Color(0xFF3347C4),
//                 onPressed: () {},
//               ),
//               ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                       padding: WidgetStatePropertyAll(
//                           EdgeInsets.symmetric(horizontal: 64, vertical: 15)),
//                       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                       backgroundColor:
//                           WidgetStatePropertyAll(Color(0xFF3347C4))),
//                   child: Text(
//                     'Buy Now',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w600),
//                   ))
//             ],
//           ))