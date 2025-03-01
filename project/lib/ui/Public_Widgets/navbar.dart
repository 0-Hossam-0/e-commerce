import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/Public_Widgets/curve_shape.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CustomCircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: const Icon(Icons.home, size: 30), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.favorite, size: 30), onPressed: () {}),
          const SizedBox(width: 40),
          IconButton(
              icon: const Icon(Icons.notifications, size: 30), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.person, size: 30), onPressed: () {}),
        ],
      ),
    );
  }
}
