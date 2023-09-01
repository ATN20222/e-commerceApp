import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool pass = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/6300830.jpg',
                width: 180,
                height: 180,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Sign in your account',
                style: TextStyle(
                  color: Color.fromARGB(220, 158, 158, 158),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 158, 158, 158),
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                obscureText: pass,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        pass = !pass;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 158, 158, 158),
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  onPressed: () {}),
              SizedBox(height: 40),
              GestureDetector(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 211, 191, 11),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
