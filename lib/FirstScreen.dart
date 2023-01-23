import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

        splash: Image.asset('assets/images/splashScreen.png'),
         splashTransition: SplashTransition.rotationTransition,

        nextScreen: Login() );
  }
}
