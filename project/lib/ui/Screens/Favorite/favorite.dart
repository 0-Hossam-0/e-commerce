import 'package:flutter/material.dart';
import 'package:project/ui/Public_Widgets/NavBar.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<FavoriteScreen> {
  List<WishListItem> wishlistItems = [
    WishListItem(
      name: 'Sepatu Outdoor',
      price: 400000,
      image: 'assets/images/intro1.png',
    ),
    WishListItem(
      name: 'Sepatu Nike',
      price: 500000,
      image: 'assets/images/intro1.png',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = wishlistItems.where((item) {
      final lowerName = item.name.toLowerCase();
      final lowerQuery = searchQuery.toLowerCase();
      return lowerName.contains(lowerQuery);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: const Color(0xFF3347C4),
        child: const Icon(Icons.shopping_cart, color: Colors.white, size: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Favorite List",
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18.sp),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (val) {
                  setState(() => searchQuery = val);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 18.sp),
                  hintText: 'Search Favorite',
                  hintStyle: TextStyle(fontSize: 15.sp),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 1.5.h),
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 15.w,
                        height: 8.h,
                        margin: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(8),
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
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '\$${item.price.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: const Color(0xFF3347C4),
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF7A00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 1.2.h,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3.w),
                      IconButton(
                        icon:
                            Icon(Icons.delete, color: Colors.red, size: 22.sp),
                        onPressed: () => _showDeleteDialog(item),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(WishListItem item) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            "Delete Item?",
            style: TextStyle(fontSize: 16.sp),
          ),
          content: Text(
            "Are you sure you want to remove ${item.name} from the favorite list?",
            style: TextStyle(fontSize: 15.sp),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("Cancel", style: TextStyle(fontSize: 15.sp)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  wishlistItems.remove(item);
                });
                Navigator.of(ctx).pop();
              },
              child: Text("Delete", style: TextStyle(fontSize: 15.sp)),
            ),
          ],
        );
      },
    );
  }
}

// Basic Model Class
class WishListItem {
  final String name;
  final double price;
  final String image;

  WishListItem({
    required this.name,
    required this.price,
    required this.image,
  });
}
