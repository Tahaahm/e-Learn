// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_field, non_constant_identifier_names, sized_box_for_whitespace, use_build_context_synchronously, avoid_print

import 'package:e_learn_second/auth/auth_method.dart';
import 'package:e_learn_second/pages/main_page.dart';
import 'package:e_learn_second/pages/register_page.dart';
import 'package:e_learn_second/routes/routes.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  List items = [
    "assets/images/google_logo.svg",
    "assets/images/facebook_logo.svg",
    "assets/images/apple_logo.svg"
  ];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void data() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      Get.snackbar(res, "You are SignIn",
          backgroundColor: primary, colorText: textWhite);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => MainPage(),
        ),
      );
    } else {
      Get.snackbar("Error", res,
          backgroundColor: primary, colorText: textWhite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      child: Lottie.network(
                        "https://assets9.lottiefiles.com/packages/lf20_hy4txm7l.json",
                        repeat: true,
                      ),
                    ),
                    SizedBox(
                      height: smallSpacer,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: textBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Welcome back! Let's start Learning",
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: smallSpacer,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: primary,
                          )),
                    ),
                    Divider(
                      color: grey,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: smallSpacer,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.key,
                            color: primary,
                          )),
                    ),
                    Divider(
                      color: grey,
                      thickness: 0.5,
                      endIndent: 1.0,
                    ),
                    SizedBox(
                      height: miniSpacer,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "You don't have an account?",
                          style: TextStyle(color: grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: smallSpacer,
                    ),
                    InkWell(
                      onTap: data,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        height: spacer,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(0.7),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: _isLoading
                            ? CircularProgressIndicator(color: textWhite)
                            : Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: spacer,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Or sign in with",
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacer,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          items.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SvgPicture.asset(items[index]),
                              )),
                    ),
                    SizedBox(
                      height: spacer,
                    ),
                  ]))
        ]),
      ),
    );
  }
}
