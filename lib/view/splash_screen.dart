 
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:co_workit/view/auth/login.dart';
import 'package:co_workit/view/auth/login_screen.dart';
import 'package:co_workit/view/bottom_bar/bottom_navigation_bar.dart';
import 'package:co_workit/view/home_screens.dart/home_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/images/Coworkit-2.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen:   LoginScreen(),
        ),
       ),
    );
  }
}
