import 'package:ecommerce/screens/home_page2.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    @override
    @override
    void initState() {
      super.initState();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage2(),
            ),
          );
        },
      );
    }

    @override
    void dispose() {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      super.dispose();
    }

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
