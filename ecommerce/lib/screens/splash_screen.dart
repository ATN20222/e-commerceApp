import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void Nabigate() {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MainScreen();
        },
      ));
    }

    Future.delayed(Duration(seconds: 5), Nabigate);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                  "assets/animations/SplashScreenAnimation.json"),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(children: [
                  LottieBuilder.asset(
                    "assets/animations/Welcome.json",
                    height: 50,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
