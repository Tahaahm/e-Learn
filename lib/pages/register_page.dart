// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_field, use_build_context_synchronously, sized_box_for_whitespace, unused_local_variable

import 'package:e_learn_second/auth/auth_method.dart';
import 'package:e_learn_second/routes/routes.dart';
import 'package:e_learn_second/routes/utils.dart';
import 'package:e_learn_second/theme/colors.dart';
import 'package:e_learn_second/theme/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  Uint8List? _image;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signUpPage(
        email: _emailController.text,
        password: _passwordController.text,
        user: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      Get.toNamed(RouteHelper.mainPage);
    } else {
      Get.snackbar("Error", res,
          backgroundColor: primary, colorText: textWhite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 55),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: miniSpacer,
              ),
              Column(children: [
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        radius: 65,
                                        backgroundImage: MemoryImage(_image!),
                                      )
                                    : Lottie.network(
                                        "https://assets4.lottiefiles.com/packages/lf20_yMTq6U/photo.json",
                                        height: 180),
                                _image != null
                                    ? Positioned(
                                        right: 2,
                                        bottom: 2,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add_a_photo,
                                            color: Colors.white,
                                          ),
                                          onPressed: selectImage,
                                        ))
                                    : Positioned(
                                        right: 2,
                                        bottom: 2,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add_a_photo,
                                            color: Colors.black,
                                          ),
                                          onPressed: selectImage,
                                        ))
                              ],
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
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                hintText: "Username",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email,
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
                            height: miniSpacer,
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
                          TextField(
                            obscureText: false,
                            controller: _bioController,
                            decoration: InputDecoration(
                                hintText: "Bio",
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
                            height: miniSpacer,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Do you have an account?",
                                style: TextStyle(color: grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  "SignIn",
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
                            onTap: () {
                              signUp();
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
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                            ),
                          ),
                        ])),
                SizedBox(
                  height: spacer,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
