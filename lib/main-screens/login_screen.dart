import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technozia/constants/utils.dart';
import 'package:technozia/main-screens/signup_screen.dart';
import 'package:technozia/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInForm = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void signIn() {
    authServices.signInUser(
      context: context,
      email: _email.text,
      password: _password.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff03071e),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff295270),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff295270),
                Color(0xff524175),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              transform: GradientRotation(1.5708),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(
                    child: Column(
                      children: [
                        Text(
                          "Technozia",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "\"Fueling Tech Passion, Driving Success\"",
                          style: TextStyle(
                            color: Color(0xff8d99ae),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Image.asset('assets/login_image_2.png'),
                ),
                Container(
                  // color: Colors.red,
                  margin: const EdgeInsets.only(left: 24, top: 12),
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            letterSpacing: 1,
                            color: Color(0xfff1faee)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Please sign in to continue.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 2,
                            color: Color(0xff8d99ae)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Form(
                  key: signInForm,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffddd5d8),
                        ),
                        child: TextFormField(
                          controller: _email,
                          autofocus: false,
                          style: const TextStyle(
                            color: Color(0xff03071e),
                            fontWeight: FontWeight.bold,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Color(0xff03071e),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffddd5d8),
                        ),
                        child: TextFormField(
                          controller: _password,
                          autofocus: false,
                          obscureText: true,
                          style: const TextStyle(
                            color: Color(0xff03071e),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Color(0xff03071e),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (signInForm.currentState!.validate()) {
                            signIn();
                          }
                        },
                        child: const Icon(
                          size: 48,
                          Icons.arrow_circle_right_rounded,
                          color: Color(0xffACC8E4),
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                              color: Color(0xffACC8E4)),
                        ),
                        onPressed: () {
                          showSnackBar(context,
                              "Under maintainance, contact admin@presidency.edu.in for further procedure");
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                            style: TextStyle(color: Color(0xff8d99ae)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                SignupScreen.routeName,
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Color(0xffACC8E4),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
