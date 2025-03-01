import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  final dynamic icon;
  final VoidCallback? onTap;
  const ColorWidget({super.key, required this.color, required this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(icon is IconData ? 0 : 18.sp),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: icon is IconData
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 20.sp,
              ),
            )
          : null,
    );
  }
}
