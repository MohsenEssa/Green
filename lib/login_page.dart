import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:green/auth/auth_controller.dart';
import 'package:green/Customer_signup.dart';
import 'package:green/welcome_page.dart';

import 'home_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String selectedOption = 'User';
  List<String> options = ['User', 'Seller', 'Gardner', 'Expert'];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w, //to make the container full width
              child: Center(
                child: Column(
                  //move the column to left of the screen
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 125),
                      child: Row(
                        children: [
                          const Text(
                            'Green',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            'img/green-icon2.png',
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Think Clean, Think Green',
                      style: TextStyle(
                        fontFamily: "times new roman",
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green[700],
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.green[700],
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login Type:',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 20),
                        DropdownButton<String>(
                          value: selectedOption,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue!;
                            });
                          },
                          items: options.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Forgot Password
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                bool isLoggedIn = await AuthController.instance.login(
                  context,
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );

                if (isLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                margin: const EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('img/green-rectangle.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.08),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
                children: [
                  TextSpan(
                    text: ' Create Account',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(const WelcomePage());
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
