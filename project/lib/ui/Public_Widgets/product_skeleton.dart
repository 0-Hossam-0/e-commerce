import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: MediaQuery.sizeOf(context).width ~/ 180,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer(
            color: Colors.black,
            colorOpacity: 0.5,
            duration: Duration(seconds: 1),
            child: SizedBox(),
          );
        });
  }
}
