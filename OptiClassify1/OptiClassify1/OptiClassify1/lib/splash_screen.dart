import 'package:OptiClassify/signin_email_textfield.dart';
import 'package:OptiClassify/signin_password_textfield.dart';
import 'package:OptiClassify/widget/plant_recogniser.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool remember = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
              ),
          child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Image.asset('assets/Orange Logo.png'),
                          ),

                        ],
                      ),
                      SignInEmailTextField(
                        controller: emailController,
                        text: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignInPasswordTextField(
                        controller: passwordController,
                        text: 'Password',
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      TextButton(
                        onPressed: () {Navigator.pushNamed(context,
                            HomePage.routeName);},
                        child: Container(
                          width: 280,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xfffd7901),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          child: const Center(
                              child: Text('Continue',
                                  style: TextStyle(
                                    fontFamily: 'MazzardM',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),

                    ],
                  ),
                ),
              )
          )),
    );
  }
}


