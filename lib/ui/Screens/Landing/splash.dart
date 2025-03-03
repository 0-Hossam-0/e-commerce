import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Login/logic/login_cubit.dart';
import 'package:project/data/Login/repository/api.dart';
import 'package:project/ui/Screens/Landing/Widgets/intro_screen.dart';
import 'package:project/ui/Screens/Login/Login.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  final int totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroPage(
            onPageChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 30,
            left: (100.w - 200) / 2,
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF3347C4)),
                elevation: MaterialStateProperty.all(10),
                shadowColor: MaterialStateProperty.all(const Color(0xFF3347C4)),
              ),
              onPressed: () {
                if (currentPage == totalPages - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return BlocProvider(
                        create: (context) => LoginCubit(LoginServices()),
                        child: LoginScreen(),
                      );
                    }),
                  );
                } else {
                  introKey.currentState?.next();
                }
              },
              child: Text(
                currentPage == totalPages - 1 ? 'Start' : 'Next',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
