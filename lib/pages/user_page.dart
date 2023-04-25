// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_import, avoid_print, use_build_context_synchronously

import 'package:e_learn_second/auth/auth_method.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:e_learn_second/widgets/custom_button.dart';
import 'package:e_learn_second/widgets/custom_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List items = [
    "assets/images/google_logo.svg",
    "assets/images/facebook_logo.svg",
    "assets/images/apple_logo.svg"
  ];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _RegControllerEmail = TextEditingController();
  final TextEditingController _RegControllerPassword = TextEditingController();
  final TextEditingController _RegControllerConfirmPassword =
      TextEditingController();
  final TextEditingController _RegControllerUser = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _RegControllerConfirmPassword.dispose();
    _RegControllerEmail.dispose();
    _RegControllerUser.dispose();
    _RegControllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Account",
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
              "Student",
              style: TextStyle(
                color: grey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: spacer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "About Us",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset("assets/images/arrow_up_icon.svg")
              ],
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Help and Support",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset("assets/images/arrow_up_icon.svg")
              ],
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Team and Conditions",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset("assets/images/arrow_up_icon.svg")
              ],
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Privacy Polic",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset("assets/images/arrow_up_icon.svg")
              ],
            ),
            SizedBox(
              height: spacer,
            ),
            //sheet
            InkWell(
              onTap: () {
                //Login Page
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: ((context) => Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(child: Container()),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: grey.withOpacity(0.3),
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
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
                                height: smallSpacer,
                              ),
                              InkWell(
                                onTap: () {},
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
                                  child: Text(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    items.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: SvgPicture.asset(items[index]),
                                        )),
                              ),
                              SizedBox(
                                height: spacer,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text("Come join us?"),
                                  GestureDetector(
                                    onTap: () {
                                      //Register
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        context: context,
                                        builder: ((context) => Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20, top: 50),
                                              child: SingleChildScrollView(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Expanded(
                                                            child: Container()),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              color: grey
                                                                  .withOpacity(
                                                                      0.3),
                                                            ),
                                                            child: Icon(
                                                                Icons.close),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                                      "Sign Up",
                                                      style: TextStyle(
                                                        color: textBlack,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: smallSpacer,
                                                    ),
                                                    TextField(
                                                      controller:
                                                          _RegControllerUser,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Full Name",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              prefixIcon: Icon(
                                                                Icons.person,
                                                                color: primary,
                                                              )),
                                                    ),
                                                    Divider(
                                                      color: grey,
                                                      thickness: 0.5,
                                                      endIndent: 1.0,
                                                    ),
                                                    TextField(
                                                      controller:
                                                          _RegControllerEmail,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: "Email",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              prefixIcon: Icon(
                                                                Icons.email,
                                                                color: primary,
                                                              )),
                                                    ),
                                                    Divider(
                                                      color: grey,
                                                      thickness: 0.5,
                                                    ),
                                                    TextField(
                                                      controller:
                                                          _RegControllerPassword,
                                                      obscureText: true,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Password",
                                                              border:
                                                                  InputBorder
                                                                      .none,
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
                                                    TextField(
                                                      controller:
                                                          _RegControllerConfirmPassword,
                                                      obscureText: true,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Cofirm Password",
                                                              border:
                                                                  InputBorder
                                                                      .none,
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
                                                      height: smallSpacer,
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: double.maxFinite,
                                                        height: spacer,
                                                        decoration: BoxDecoration(
                                                            color: primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: primary
                                                                    .withOpacity(
                                                                        0.7),
                                                                blurRadius: 10,
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ]),
                                                        child: Text(
                                                          "Sign Up",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: spacer,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: List.generate(
                                                          items.length,
                                                          (index) => Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                                child: SvgPicture
                                                                    .asset(items[
                                                                        index]),
                                                              )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      );
                                    },
                                    child: Text(
                                      " Sign Up",
                                      style: TextStyle(
                                          color: primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              },
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
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  AuthMethod().signOut();
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
