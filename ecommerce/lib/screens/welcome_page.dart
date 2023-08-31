import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to our e-commerce store!',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "logo",
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset('assets/images/opening.jpg'),
            SizedBox(height: 10.0),
            Text(
              'Start shopping now!',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "display",
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //TODO go to SignIn page
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    //TODO go to SignUp page
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
