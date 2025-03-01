import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/Login/logic/login_cubit.dart';
import 'package:project/data/Login/repository/api.dart';
import 'package:project/data/Signup/logic/signup_cubit.dart';
import 'package:project/ui/Public_Widgets/input_field.dart';
import 'package:project/ui/Public_Widgets/social_button.dart';
import 'package:project/ui/Screens/Login/login.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isEmailError = false;
  bool isUsernameError = false;
  bool isPasswordError = false;
  @override
  Widget build(BuildContext context) {
    void _signup() {
      final username = _usernameController.text;
      final email = _emailController.text;
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
      if (email.isEmpty) {
        setState(() {
          isEmailError = true;
        });
      } else {
        setState(() {
          isEmailError = false;
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
      if (!isEmailError && !isPasswordError && !isUsernameError) {
        context.read<SignUpCubit>().fetchSignUpn(username, email, password);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/signup.png'),
                  SizedBox(height: 20),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0xFF3347C4),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpLoaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Account Has Been Created Successfully.")),
                        );
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (_) => LoginCubit(LoginServices()),
                            child: LoginScreen(),
                          );
                        }));
                      } else if (state is SignUpError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Something went wrong.")),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return CircularProgressIndicator();
                      }
                      return Text('');
                    },
                  ),
                  SizedBox(height: 10),
                  InputField(
                      borderColor: isEmailError ? Colors.red : Colors.black,
                      controller: _emailController,
                      placeholder: 'Email',
                      prefixIcon: Icon(Icons.email),
                      isSecured: false),
                  SizedBox(height: 5),
                  Text(
                    isEmailError ? 'Email Field Is Empty' : '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  InputField(
                      controller: _usernameController,
                      borderColor: isUsernameError ? Colors.red : Colors.black,
                      placeholder: 'Username',
                      prefixIcon: Icon(Icons.person),
                      isSecured: false),
                  SizedBox(height: 5),
                  Text(
                    isUsernameError ? 'Username Field Is Empty' : '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  InputField(
                      borderColor: isPasswordError ? Colors.red : Colors.black,
                      controller: _passwordController,
                      placeholder: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      isSecured: true),
                  SizedBox(height: 5),
                  Text(
                    isPasswordError ? 'Password Field Is Empty' : '',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
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
                      onPressed: _signup,
                      child: Text(
                        'Sign Up',
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
                            fontSize: 15.sp, color: Color(0xFF828282)),
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
                              create: (_) => LoginCubit(LoginServices()),
                              child: LoginScreen(),
                            );
                          }));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xFF3347C4),
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
