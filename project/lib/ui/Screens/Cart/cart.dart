import 'package:flutter/material.dart';
// import 'package:project/data/Cart/add_product.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> items = [
    CartItem(
      name: "Sepatu Nike",
      price: 500000,
      image: "assets/images/intro1.png",
      quantity: 1,
      selected: true,
    ),
    CartItem(
      name: "Console Xbox",
      price: 400000,
      image: "assets/images/intro1.png",
      quantity: 1,
      selected: false,
    ),
    CartItem(
      name: "Sepatu Outdoor",
      price: 400000,
      image: "assets/images/intro1.png",
      quantity: 1,
      selected: false,
    ),
  ];
  @override
  void initState() {
    super.initState();
    // items = item.getAll();
  }


  @override
  Widget build(BuildContext context) {
    double totalPrice = items.fold<double>(
      0,
      (sum, item) => sum + (item.selected ? item.price * item.quantity : 0),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18.sp),
          onPressed: () {},
        ),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: ValueKey(item.name),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog<bool>(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: Text(
                            "Delete Item?",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          content: Text(
                            "Are you sure you want to remove ${item.name} from the cart?",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(false),
                              child: Text("Cancel",
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(true),
                              child: Text("Delete",
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: item.selected,
                          onChanged: (bool? val) {
                            setState(() => item.selected = val ?? false);
                          },
                          activeColor: const Color(0xFF3347C4),
                        ),
                        Container(
                          width: 15.w,
                          height: 8.h,
                          margin: EdgeInsets.only(right: 4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: item.image.isNotEmpty
                              ? Image.asset(item.image, fit: BoxFit.contain)
                              : const SizedBox(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "\$${item.price.toStringAsFixed(0)}",
                                style: TextStyle(
                                  color: const Color(0xFF3347C4),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(1.h),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE6E6E6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.remove, size: 18),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    "${item.quantity}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  InkWell(
                                    onTap: () {
                                      setState(() => item.quantity++);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(1.h),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE6E6E6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.add, size: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    Text(
                      "\$${totalPrice.toStringAsFixed(0)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.5.h,
                      horizontal: 6.w,
                    ),
                    backgroundColor: const Color(0xFF3347C4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Check Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  String name;
  double price;
  String image;
  int quantity;
  bool selected;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.selected,
  });
}
