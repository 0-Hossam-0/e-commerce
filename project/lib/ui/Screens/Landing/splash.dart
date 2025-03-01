import 'package:flutter/material.dart';
import 'package:project/ui/Screens/Landing/Widgets/intro_screen.dart';
import 'package:project/ui/Screens/Login/Login.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        IntroPage(),
        Positioned(
            bottom: 30,
            left: (100.w - 200) / 2,
            child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(200, 40)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  backgroundColor: WidgetStateProperty.all(Color(0xFF3347C4)),
                  elevation: WidgetStateProperty.all(10),
                  shadowColor: WidgetStateProperty.all(Color(0xFF3347C4)),
                ),
                onPressed: () {
                  final currentPage =
                      introKey.currentState?.getCurrentPage() ?? 0;
                  final totalPages =
                      introKey.currentState?.getPagesLength() ?? 0;
                  if (currentPage == totalPages - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  }
                  introKey.currentState?.next();
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                )))
      ]),
    );
  }
}
