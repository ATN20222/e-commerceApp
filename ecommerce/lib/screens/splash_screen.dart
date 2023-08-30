import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void Nabigate() {
      // should be pushReplacement
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen();
        },
      ));
    }

    Future.delayed(Duration(seconds: 4), Nabigate);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SplashBackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "assets/animations/SplashScreenAnimation.json",
                ),
                Text(
                  "Swift Shop,Smart Buy",
                  style: TextStyle(
                    fontFamily: "logo",
                    fontSize: 20,
                  ),
                ),
                LottieBuilder.asset(
                  "assets/animations/Welcome.json",
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
