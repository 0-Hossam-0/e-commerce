import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Login/logic/login_cubit.dart';
import 'package:project/data/Signup/logic/signup_cubit.dart';
import 'package:project/data/Signup/repository/api.dart';
import 'package:project/ui/Public_Widgets/input_field.dart';
import 'package:project/ui/Public_Widgets/social_button.dart';
import 'package:project/ui/Screens/Home/home.dart';
import 'package:project/ui/Screens/Signup/signup.dart';
import 'package:sizer/sizer.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isUsernameError = false;
  bool isPasswordError = false;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty) {
      setState(() {
        isUsernameError = true;
      });
    } else {
      setState(() {
        isUsernameError = false;
      });
    }
    if (password.isEmpty) {
      setState(() {
        isPasswordError = true;
      });
    } else {
      setState(() {
        isPasswordError = false;
      });
    }
    if (!isPasswordError && !isUsernameError) {
      context.read<LoginCubit>().fetchLogin(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/login.png'),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xFF3347C4),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoaded) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else if (state is LoginError) {
                        setState(() {
                          isUsernameError = true;
                          isPasswordError = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Username or Password is wrong.")),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CircularProgressIndicator(
                          color: Color(0xFF3347C4),
                        );
                      }
                      return Text('');
                    },
                  ),
                  SizedBox(height: 10),
                  InputField(
                      controller: _usernameController,
                      placeholder: 'Username',
                      borderColor: isUsernameError ? Colors.red : Colors.black,
                      prefixIcon: Icon(Icons.email),
                      isSecured: false),
                  SizedBox(height: 5),
                  Text(
                    isUsernameError ? 'Username Input Is Wrong' : '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  InputField(
                      controller: _passwordController,
                      placeholder: 'Password',
                      borderColor: isPasswordError ? Colors.red : Colors.black,
                      prefixIcon: Icon(Icons.lock),
                      isSecured: true),
                  SizedBox(height: 5),
                  Text(
                    isPasswordError ? 'Password Input Is Wrong' : '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0xFF3347C4)),
                          shadowColor:
                              WidgetStateProperty.all(Color(0xFF3347C4)),
                          elevation: WidgetStateProperty.all(10),
                          fixedSize: WidgetStateProperty.all(Size(90.w, 6.h)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                      onPressed: _login,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFC4C4C4),
                          indent: 25.w,
                          endIndent: 10,
                          thickness: 3,
                        ),
                      ),
                      Text(
                        'Or',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF828282)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFC4C4C4),
                          indent: 10,
                          endIndent: 25.w,
                          thickness: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                          imagePath: 'assets/images/facebook-icon.png',
                          hoverColor: Color.fromARGB(255, 65, 53, 235)),
                      SizedBox(width: 20),
                      SocialButton(
                          imagePath: 'assets/images/google-icon.png',
                          hoverColor: Color.fromARGB(255, 226, 80, 80)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                            color: Color(0xFF828282), fontSize: 15.sp),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                WidgetStatePropertyAll(Colors.transparent),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.transparent),
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return BlocProvider(
                              create: (_) => SignUpCubit(SignUpServices()),
                              child: SignUpScreen(),
                            );
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xFF3347C4),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
